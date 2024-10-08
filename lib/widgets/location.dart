import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String choosenCity;
  const LocationWidget({super.key, required this.choosenCity});

  @override
  Widget build(BuildContext context) {
    return Text(
      choosenCity,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
