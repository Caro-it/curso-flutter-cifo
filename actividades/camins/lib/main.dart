import 'package:flutter/material.dart';

import 'package:camins/screens/trail_detail_screen.dart';

void main() {
  runApp(const CaminsApp());
}

class CaminsApp extends StatelessWidget {
  const CaminsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrailDetailScreen(),
    );
  }
}