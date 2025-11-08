import 'package:flutter/material.dart';

class LexLogo extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const LexLogo({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start, // default for normal pages
    this.mainAxisAlignment = MainAxisAlignment.start,   // default for normal pages
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: const [
            Icon(Icons.balance, color: Colors.teal, size: 22),
            SizedBox(width: 6),
            Text(
              "LEX",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(
          "Lawyer Connect",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
