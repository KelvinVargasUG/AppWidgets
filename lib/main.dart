import 'package:flutter/material.dart';
import 'package:widgets_app/Config/Theme/app_theme.dart';
import 'package:widgets_app/Presentation/Screens/Button/button_screen.dart';
import 'package:widgets_app/Presentation/Screens/Cards/card_screen.dart';
import 'package:widgets_app/Presentation/Screens/Home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home:  const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonScreen(),
        '/cards': (context) => const CardScreen()
      },    
    );
  }
}
