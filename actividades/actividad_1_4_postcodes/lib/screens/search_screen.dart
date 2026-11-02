import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // NUEVO

import '../models/place.dart'; // NUEVO
import '../models/search_response.dart'; // NUEVO
import '../models/search_status.dart'; // NUEVO
import '../styles/app_styles.dart';
import '../widgets/message_view.dart';
import '../widgets/place_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  SearchStatus _status = SearchStatus.initial; // NUEVO: estado de la pantalla
  List<Place> _places = []; // NUEVO: resultados
  String _query = ''; // NUEVO: lo último buscado

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    switch (_status) {
      case SearchStatus.initial:
        return const MessageView(
          icon: Icons.travel_explore,
          text:
              'Escriu un codi postal (per exemple, 17820)\n'
              'o el nom d\'una població (per exemple, Banyoles).',
        );
      case SearchStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case SearchStatus.notFound:
        return MessageView(
          icon: Icons.location_off,
          text: 'No hem trobat cap població per a «$_query».',
        );
      case SearchStatus.error:
        return MessageView(
          icon: Icons.wifi_off,
          color: AppStyles.error,
          text:
              'No s\'ha pogut connectar amb el servidor.\n'
              'Comprova la connexió i torna-ho a provar.',
          buttonText: 'Torna-ho a provar',
          onPressed: () => _search(_query),
        );
      case SearchStatus.success:
        return ListView.builder(
          itemCount: _places.length,
          itemBuilder: (context, i) => PlaceTile(place: _places[i]),
        );
    }
  }

  // NUEVO: la búsqueda
  Future<void> _search(String text) async {
    final query = text.trim();
    if (query.isEmpty) return;

    setState(() {
      _query = query;
      _status = SearchStatus.loading; // → CARGANDO
    });

    try {
      final uri = Uri.https('geocoding-api.open-meteo.com', '/v1/search', {
        'name': query,
        'language': 'ca',
        'countryCode': 'ES',
      });

      final response = await http.get(uri);
      if (!mounted) return;

      if (response.statusCode != 200) {
        setState(() => _status = SearchStatus.error); // → ERROR (servidor)
        return;
      }

      final places = searchResponseFromJson(response.body).results;
      setState(() {
        _places = places;
        _status = places.isEmpty
            ? SearchStatus
                  .notFound // → NO ENCONTRADO
            : SearchStatus.success; // → RESULTADOS
      });
      debugPrint('Estat: $_status · Trobades: ${places.length}'); // provisional
    } catch (e) {
      debugPrint('Error: $e');
      if (!mounted) return;
      setState(() => _status = SearchStatus.error); // → ERROR (sin internet)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codis postals'),
        backgroundColor: AppStyles.primary,
        foregroundColor: AppStyles.onPrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppStyles.spaceM),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: _search, // NUEVO: ahora busca de verdad
              decoration: const InputDecoration(
                hintText: 'Codi postal o població',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }
}
