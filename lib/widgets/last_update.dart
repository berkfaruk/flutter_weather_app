import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last Update : ' + TimeOfDay(hour: 20, minute: 35).format(context),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
