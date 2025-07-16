import 'package:flutter/material.dart';

class SeatTile extends StatelessWidget {
  const SeatTile({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.purple
            : Theme.of(context).brightness == Brightness.light
            ? Colors.grey[300]
            : Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
