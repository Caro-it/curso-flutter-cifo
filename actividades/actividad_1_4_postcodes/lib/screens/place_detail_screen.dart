import 'package:flutter/material.dart';

import '../models/place.dart';
import '../styles/app_styles.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place; // la población que ha tocado el usuario

  @override
  Widget build(BuildContext context) {
    // Copia ordenada de los códigos postales (si no hay, lista vacía)
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
