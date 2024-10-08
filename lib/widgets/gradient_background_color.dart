import 'package:flutter/material.dart';

class GradientBackgroundColor extends StatelessWidget {
  final Widget child;
  final MaterialColor color;
  const GradientBackgroundColor(
      {required this.child, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.shade700, color.shade500, color.shade200],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.6, 0.8, 1]
        ),
      ),
    );
  }
}
