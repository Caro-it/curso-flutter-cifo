import 'package:camins/styles/app_styles.dart';
import 'package:camins/widgets/stage_tile.dart';
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
          // ───────── ZONA 5 · Fotos ─────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fotos', style: AppStyles.sectionTitle),
                    Text('Veure-les totes', style: AppStyles.link),
                  ],
                ),
                AppStyles.smallSeparator,
                GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final photo in [
                      'lake',
                      'peaks',
                      'forest',
                      'meadow',
                      'waterfall',
                    ])
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/$photo.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/images/sunset.jpg',
                            fit: BoxFit.cover,
                          ),
                          Container(color: Colors.black54),
                          Center(
                            child: Text('+18', style: AppStyles.photoCount),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ───────── ZONA 6 · Etapes ─────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Etapes', style: AppStyles.sectionTitle),
                AppStyles.smallSeparator,
                StageTile(
                  number: 1,
                  name: 'Banys de Tredòs',
                  detail: 'Sortida · 1.750 m',
                  time: '0:00',
                ),
                StageTile(
                  number: 2,
                  name: 'Refugi de Colomers',
                  detail: '3,1 km · 2.135 m',
                  time: '1:10',
                ),
                StageTile(
                  number: 3,
                  name: 'Estany Major',
                  detail: '4,6 km · 2.180 m',
                  time: '1:45',
                ),
                StageTile(
                  number: 4,
                  name: 'Estany Obago',
                  detail: '6,2 km · 2.240 m',
                  time: '2:30',
                ),
                const StageTile(
                  number: 5,
                  name: 'Tornada als Banys',
                  detail: '9,4 km · 1.750 m',
                  time: '3:45',
                ),
              ],
            ),
          ),
          AppStyles.bigSeparator,
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
