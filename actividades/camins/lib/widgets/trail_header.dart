import 'package:camins/styles/app_styles.dart';
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
            bottom: 20,
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
        ],
      ),
    );
  }
}
