import 'package:camins/styles/app_styles.dart';
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
          // Aquí aniran les zones, de dalt a baix
          Image.asset('assets/images/header.jpg'),
        ],
      ),
      // bottomNavigationBar: aquí irá la barra inferior
    );
  }
}
