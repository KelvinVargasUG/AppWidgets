import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.cyan,
  Colors.pink,
  Colors.purple,
  Colors.deepOrange,
  Colors.indigo,
  Colors.teal,
  Colors.green,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Invalid color index!, Please select a color between 0 and ${colorList.length - 1}');

  ThemeData getThemeLigth() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ));
}
