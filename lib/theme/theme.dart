import 'package:flutter/material.dart';

var themeData = ThemeData(
    primarySwatch: Colors.purple,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(color: Colors.white));

class ThemeStyle {
  var menuButtonText;
  var menuButtonIcon;

  ThemeStyle(ThemeData theme) {
    menuButtonText = theme.textTheme.button.copyWith(color: Colors.purple[600]);
    menuButtonIcon = Colors.purple[600];
  }
}
