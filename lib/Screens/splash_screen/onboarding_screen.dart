import 'package:flutter/material.dart';
import 'package:flutter_graduation_app/utils/navigation_helper.dart';
import 'package:flutter_graduation_app/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int currentPage = 0;
  // ignore: unused_field
  late AnimationController _animationController;

  final List<Map<String, String>> slides = [
    {
      "title": "Trust & Security",
      "subtitle": "Verified lawyers. Secure communication and payment.",
      "image": "assets/images/img1-removebg-preview.png",
    },
    {
      "title": "Verified Professionals",
      "subtitle": "Every lawyer passes identity and guild verification.",
      "image": "assets/images/img2-removebg-preview.png",
    },
    {
      "title": "Find the right lawyer for your case",
      "subtitle": "Filter by specialty, location and ratings.",
      "image": "assets/images/img3-removebg-preview.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  void nextPage() {
    if (currentPage < slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      NavigationHelper.navigateToHome(context);
    }
  }

  void skip() {
    _pageController.animateToPage(
      slides.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Row(
                        children: [
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
                  ),
                  if (currentPage < slides.length - 1)
                    TextButton(
                      onPressed: skip,
                      child: const Text("Skip",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14)),
                    ),
                ],
              ),
            ),

            // 📱 PAGEVIEW - Enhanced UI/UX
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemBuilder: (context, index) {
                  final slide = slides[index];

                  return AnimatedOpacity(
                    opacity: currentPage == index ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // 🧠 Title + Subtitle Section
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                slide["title"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  slide["subtitle"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15.5,
                                    color: Colors.black54,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // 🎞️ Animated Image Section
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 10),
                              child: AnimatedSlide(
                                offset: currentPage == index
                                    ? Offset.zero
                                    : const Offset(0, 0.3),
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeOut,
                                child: AnimatedScale(
                                  scale: currentPage == index ? 1 : 0.9,
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  child: Image.asset(
                                    slide["image"]!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // 🔘 Indicators + Button
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  slides.length,
                                  (dotIndex) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 8,
                                    width: currentPage == dotIndex ? 22 : 8,
                                    decoration: BoxDecoration(
                                      color: currentPage == dotIndex
                                          ? Colors.teal
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              AnimatedOpacity(
                                opacity: currentPage == index ? 1 : 0,
                                duration: const Duration(milliseconds: 400),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: CustomButton(
                                    text: currentPage == slides.length - 1
                                        ? "Get Started"
                                        : "Next",
                                    onPressed: () {
                                      if (currentPage == slides.length - 1) {
                                        // TODO: Navigate to login or home
                                      } else {
                                        _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
