import 'package:flutter/material.dart';

class SeatText extends StatelessWidget {
  const SeatText({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.purple : Colors.grey[300],
          ),
        ),
        SizedBox(width: 4),
        Text(
          isSelected ? "선택됨" : "선택안됨",
          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
      ],
    );
  }
}
