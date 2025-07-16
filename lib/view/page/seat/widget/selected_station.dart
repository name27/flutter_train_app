import 'package:flutter/material.dart';

class SelectedStation extends StatelessWidget {
  const SelectedStation({super.key, required this.stationName});
  final String stationName;

  @override
  Widget build(BuildContext context) {
    return Text(
      stationName,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
