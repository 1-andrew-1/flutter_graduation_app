import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/style/app_color.dart';

class LexAuthFooter extends StatelessWidget {
  final String question;
  final String actionText;
  final VoidCallback? onTap;

  const LexAuthFooter({
    super.key,
    required this.question,
    required this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: const TextStyle(color: Colors.black54)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
              color: AppColors.link,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
