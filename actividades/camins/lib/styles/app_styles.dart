import 'package:flutter/material.dart';

class AppStyles {
  // Colors
  static final Color green = Color(0xFF2E7D5B);
  static final Color lightGreen = Color(0xFFE3F1EA);
  static final Color orange = Color(0xFFF2994A);
  static final Color darkText = Color(0xFF1F2A2E);
  static final Color greyText = Color(0xFF6B7A80);
  static final Color background = Color(0xFFF6F8F7);
  // Separators
  static final Widget tinySeparator = SizedBox(width: 4, height: 4);
  static final Widget smallSeparator = SizedBox(width: 8, height: 8);
  static final Widget mediumSeparator = SizedBox(width: 16, height: 16);
  static final Widget bigSeparator = SizedBox(width: 24, height: 24);
  // Text styles
  static final TextStyle trailTitle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle region = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1,
  );
  static final TextStyle rating = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final TextStyle ratingCount = TextStyle(
    fontSize: 15,
    color: Colors.white70,
  );
  static final TextStyle statValue = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: darkText,
  );
  static final TextStyle caption = TextStyle(fontSize: 12, color: greyText);
  static final TextStyle sectionTitle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: darkText,
  );
  static final TextStyle body = TextStyle(
    fontSize: 15,
    color: greyText,
    height: 1.5,
  );
  static final TextStyle tagText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: green,
  );
  static final TextStyle startPoint = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: darkText,
  );
    static final TextStyle buttonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}
