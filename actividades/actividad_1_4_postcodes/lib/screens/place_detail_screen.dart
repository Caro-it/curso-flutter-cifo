import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // NUEVO

import '../models/current.dart'; // NUEVO
import '../models/place.dart';
import '../models/weather_response.dart'; // NUEVO
import '../styles/app_styles.dart';

// NUEVO: ahora es StatefulWidget (dos clases)
class PlaceDetailScreen extends StatefulWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late final Future<Current> _weather; // NUEVO: la petición del tiempo

  // NUEVO: se ejecuta UNA vez, al abrir la pantalla
  @override
  void initState() {
    super.initState();
    _weather = _fetchWeather();
  }

  // NUEVO: pide el tiempo a la API con las coordenadas de la población
  Future<Current> _fetchWeather() async {
    final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': widget.place.latitude.toString(),
      'longitude': widget.place.longitude.toString(),
      'current': 'temperature_2m,weather_code,wind_speed_10m',
    });
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}');
    }
    return weatherResponseFromJson(response.body).current;
  }

  // NUEVO: traduce el weather_code según la tabla del enunciado
  String _describeWeather(int code) {
    if (code == 0) return 'Cel serè';
    if (code >= 1 && code <= 3) return 'Alguns núvols';
    if (code == 45 || code == 48) return 'Boira';
    if (code >= 51 && code <= 67) return 'Pluja';
    if (code >= 71 && code <= 77) return 'Neu';
    if (code >= 80 && code <= 82) return 'Ruixats';
    if (code == 85 || code == 86) return 'Ruixats de neu';
    if (code >= 95 && code <= 99) return 'Tempesta';
    return 'Desconegut';
  }

  @override
  Widget build(BuildContext context) {
    final place =
        widget.place; // NUEVO: en un State, los datos están en widget.
    final postcodes = [...?place.postcodes]..sort();

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: AppStyles.primary,
        foregroundColor: AppStyles.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppStyles.spaceM),
        children: [
          ListTile(
            leading: const Icon(Icons.map, color: AppStyles.primary),
            title: Text(place.admin2),
            subtitle: Text(place.admin1),
          ),
          ListTile(
            leading: const Icon(Icons.people, color: AppStyles.primary),
            title: Text(
              place.population == null ? 'Sense dades' : '${place.population}',
            ),
            subtitle: const Text('Habitants'),
          ),
          ListTile(
            leading: const Icon(Icons.place, color: AppStyles.primary),
            title: Text('${place.latitude}, ${place.longitude}'),
            subtitle: const Text('Coordenades'),
          ),
          const SizedBox(height: AppStyles.spaceM),

          // NUEVO: bloque del tiempo
          Text('El temps ara', style: Theme.of(context).textTheme.titleMedium),
          FutureBuilder<Current>(
            future: _weather,
            builder: (context, snapshot) {
              // 1. Cargando → círculo
              if (snapshot.connectionState != ConnectionState.done) {
                return const Padding(
                  padding: EdgeInsets.all(AppStyles.spaceM),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              // 2. Error → mensaje (el resto del detalle se sigue viendo)
              if (snapshot.hasError) {
                return const ListTile(
                  leading: Icon(Icons.cloud_off, color: AppStyles.error),
                  title: Text('No hem pogut carregar el temps.'),
                );
              }
              // 3. Datos → temperatura, cielo y viento
              final current = snapshot.data!;
              return ListTile(
                leading: const Icon(Icons.wb_sunny, color: AppStyles.primary),
                title: Text(
                  '${current.temperature2M} °C · '
                  '${_describeWeather(current.weatherCode)}',
                ),
                subtitle: Text('Vent: ${current.windSpeed10M} km/h'),
              );
            },
          ),
          const SizedBox(height: AppStyles.spaceM),

          Text('Codis postals', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppStyles.spaceS),
          if (postcodes.isEmpty)
            const Text('Sense codis postals')
          else
            Wrap(
              spacing: AppStyles.spaceS,
              runSpacing: AppStyles.spaceS,
              children: postcodes
                  .map((code) => Chip(label: Text(code)))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
