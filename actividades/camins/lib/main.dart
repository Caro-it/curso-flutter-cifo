import 'package:camins/screens/trail_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CaminsApp());
}

class CaminsApp extends StatelessWidget {
  const CaminsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TrailDetailScreen());
  }
}
