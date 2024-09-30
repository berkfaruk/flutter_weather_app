import 'package:flutter/material.dart';

class MaxAndMinTemperatureWidget extends StatelessWidget {
  const MaxAndMinTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Max : ' + 24.toString() + '°C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Min : ' + 12.toString() + '°C',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
