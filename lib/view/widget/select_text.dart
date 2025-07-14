import 'package:flutter/material.dart';

class SelectText extends StatelessWidget {
  const SelectText({
    super.key,
    required this.text,
    this.onTap,
    this.resultText,
    this.resultTextStyle,
  });
  final String text;
  final String? resultText;
  final Function()? onTap;
  final TextStyle? resultTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            resultText ?? '선택',
            style:
                resultTextStyle ??
                TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
          ),
        ],
      ),
    );
  }
}
