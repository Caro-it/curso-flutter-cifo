import 'package:camins/styles/app_styles.dart';
import 'package:camins/widgets/stat_item.dart';
import 'package:camins/widgets/tag_chip.dart';
import 'package:camins/widgets/trail_header.dart';
import 'package:flutter/material.dart';

class TrailDetailScreen extends StatelessWidget {
  const TrailDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.background,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ───────── ZONA 2 · Títol ─────────
          const TrailHeader(
            imagePath: 'assets/images/header.jpg',
            region: "Pirineu · Val d'Aran",
            title: 'Circuit dels Estanys de Colomers',
            rating: '4,8',
            reviewCount: 126,
          ),
          // ───────── ZONA 3 · Fitxa  ─────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.zero,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 88,
                child: Row(
                  children: [
                    const Expanded(
                      child: StatItem(
                        icon: Icons.route,
                        value: '9,4 km',
                        label: 'Distància',
                      ),
                    ),
                    const Expanded(
                      child: StatItem(
                        icon: Icons.trending_up,
                        value: '620 m',
                        label: 'Desnivell',
                      ),
                    ),
                    const Expanded(
                      child: StatItem(
                        icon: Icons.schedule,
                        value: '3 h 45',
                        label: 'Durada',
                      ),
                    ),
                    Expanded(
                      child: StatItem(
                        icon: Icons.terrain,
                        value: 'Moderada',
                        label: 'Dificultat',
                        iconColor: AppStyles.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ───────── ZONA 4 · Sobre la ruta  ─────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sobre la ruta', style: AppStyles.sectionTitle),
                AppStyles.smallSeparator,
                Text(
                  "Una volta circular pel cor del circ de Colomers, amb una "
                  "desena d'estanys d'origen glacial. El camí està ben "
                  "senyalitzat i la pujada és constant però sense trams "
                  "tècnics. Ideal per a finals de primavera i estiu.",
                  style: AppStyles.body,
                ),
                AppStyles.mediumSeparator,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    TagChip(label: 'Circular', icon: Icons.loop),
                    TagChip(label: 'Estanys', icon: Icons.water),
                    TagChip(label: 'Gossos permesos', icon: Icons.pets),
                    TagChip(label: "Font d'aigua", icon: Icons.water_drop),
                    TagChip(label: 'Refugi', icon: Icons.cabin),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Punt de sortida', style: AppStyles.caption),
                  Text('Banys de Tredòs', style: AppStyles.startPoint),
                ],
              ),
            ),
            SizedBox(
              width: 48,
              height: 48,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: AppStyles.darkText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Icon(Icons.download),
              ),
            ),
            AppStyles.smallSeparator,
            SizedBox(
              height: 48,
              child: FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppStyles.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.navigation),
                label: Text('Començar', style: AppStyles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
