import 'package:flutter/material.dart';

class LexDivider extends StatelessWidget {
  const LexDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.black12)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("or", style: TextStyle(color: Colors.black38)),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.black12)),
      ],
    );
  }
}
