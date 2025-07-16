import 'package:flutter/material.dart';

class LabelTextTile extends StatelessWidget {
  const LabelTextTile({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: text != null
          ? Center(
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            )
          : null,
    );
  }
}
