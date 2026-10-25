import 'package:flutter/material.dart';

import 'package:camins/styles/app_styles.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppStyles.darkText,
        ),
      ),
    );
  }
}