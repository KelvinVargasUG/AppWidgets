import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedScreen extends StatefulWidget {
  static const String name = "animated_screen";
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  double borderRadius = 10;

  void changeShape() {
    final random = math.Random();
    setState(() {
      width = random.nextInt(300).toDouble() + 120;
      height = random.nextInt(300).toDouble() + 120;
      color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      borderRadius = random.nextInt(100).toDouble() + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Container"),
        ),
        body: Center(
            child: AnimatedContainer(
          curve: Curves.elasticInOut,
          duration: const Duration(seconds: 1),
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: changeShape,
          child: const Icon(Icons.play_arrow),
        ));
  }
}
