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

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Invalid color index!, Please select a color between 0 and ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ));
}
