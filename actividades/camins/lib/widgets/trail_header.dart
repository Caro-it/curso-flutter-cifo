import 'package:camins/styles/app_styles.dart';
import 'package:camins/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';

class TrailHeader extends StatelessWidget {
  const TrailHeader({
    super.key,
    required this.imagePath,
    required this.region,
    required this.title,
    required this.rating,
    required this.reviewCount,
  });

  final String imagePath;
  final String region;
  final String title;
  final String rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87],
                stops: [0.4, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppStyles.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(region.toUpperCase(), style: AppStyles.region),
                ),
                AppStyles.smallSeparator,
                Text(title, style: AppStyles.trailTitle),
                AppStyles.smallSeparator,
                Row(
                  children: [
                    Icon(Icons.star, color: AppStyles.orange, size: 20),
                    AppStyles.tinySeparator,
                    Text(rating, style: AppStyles.rating),
                    AppStyles.tinySeparator,
                    Text(
                      '($reviewCount opinions)',
                      style: AppStyles.ratingCount,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Back button (top left)
          const Positioned(
            top: 44,
            left: 16,
            child: RoundIconButton(icon: Icons.arrow_back),
          ),
          // Share and favourite buttons (top right)
          Positioned(
            top: 44,
            right: 16,
            child: Row(
              children: [
                const RoundIconButton(icon: Icons.ios_share),
                AppStyles.smallSeparator,
                const RoundIconButton(icon: Icons.favorite_border),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
