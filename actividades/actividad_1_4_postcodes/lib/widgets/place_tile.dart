import 'package:flutter/material.dart';

import '../models/place.dart';
import '../styles/app_styles.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place, this.onTap});

  final Place place; // la población que muestra esta fila
  final VoidCallback? onTap; // qué pasa al tocarla (para la Ampliación)

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_city, color: AppStyles.primary),
      title: Text(place.name),
      subtitle: Text('${place.admin2} · ${place.admin1}'),
      trailing: onTap != null ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}
