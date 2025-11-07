import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/Screens/splash_screen/onboarding_screen.dart';

class NavigationHelper {
  static void navigateToOnboarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }

  static void navigateToHome(BuildContext context) {
    // TODO: replace with actual home screen later
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Welcome to Home Screen!")),
    );
  }
}
