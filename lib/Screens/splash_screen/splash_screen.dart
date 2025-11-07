import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/utils/navigation_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      NavigationHelper.navigateToOnboarding(context);
    });

    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: AnimatedScale(
          scale: 1.1,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(Icons.balance, color: Colors.white, size: 60),
              SizedBox(height: 10),
              Text(
                "LEX",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "Lawyer Connect",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
