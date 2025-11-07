import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LexSplashScreen extends StatefulWidget {
  const LexSplashScreen({super.key});

  @override
  State<LexSplashScreen> createState() => _LexSplashScreenState();
}

class _LexSplashScreenState extends State<LexSplashScreen>
    with TickerProviderStateMixin {
  bool loading = true;
  late final AnimationController _iconController;
  late final AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    // ⏳ Simulate loading time
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => loading = false);
      // 🔁 Optionally navigate to next screen here
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });

    // 🎬 Initialize animations
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _iconController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gradientColors = [
      Color(0xFF0F172A),
      Color(0xFF1E293B),
      Color(0xFF0F172A)
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // 🖼 Background image (low opacity)
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/Backgound_startup.jpeg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low, // ⚡️ Better performance
                ),
              ),
            ),

            // 🟠 Overlay gradient for depth
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xCC0F172A),
                      Color(0xFF0F172A)
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🔰 Top icons
                  FadeTransition(
                    opacity: _fadeController,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield_outlined,
                            color: Color(0x4DFFB703), size: 28),
                        SizedBox(width: 16),
                        Icon(Icons.workspace_premium_outlined,
                            color: Color(0x4DFFB703), size: 28),
                      ],
                    ),
                  ),

                  // ⚖️ Logo and title
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ScaleTransition(
                            scale: CurvedAnimation(
                              parent: _iconController,
                              curve: Curves.elasticOut,
                            ),
                            child: RotationTransition(
                              turns: Tween<double>(begin: -0.5, end: 0)
                                  .animate(_iconController),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // ✨ Glow effect
                                  Container(
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: const Color(0x33FFB703),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  // 🖼 Logo Container (Background)
                                  Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 133, 133, 110),
                                          Color.fromARGB(255, 255, 255, 255)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 20,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      // 🎨 Separated SVG Logo
                                      child: SvgPicture.asset(
                                        'assets/images/app.svg',
                                        width: 120, // smaller than container
                                        height: 120,
                                        fit: BoxFit.fill, // ✅ يملى الدائرة كلها
                                        // colorFilter: const ColorFilter.mode(
                                        //   Color.fromARGB(255, 0, 0, 0),
                                        //   BlendMode.srcIn,
                                        // ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // 💬 Text + tagline
                          FadeTransition(
                            opacity: _fadeController,
                            child: Column(
                              children: [
                                const Text(
                                  'LEX',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  height: 2,
                                  width: 96,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Color(0xFFFFB703),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Your Trusted Legal Partner',
                                  style: TextStyle(
                                    color: Color(0xFFCBD5E1),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ⏳ Loading bar + footer
                  FadeTransition(
                    opacity: _fadeController,
                    child: Column(
                      children: [
                        if (loading)
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: const LinearProgressIndicator(
                                  minHeight: 4,
                                  backgroundColor: Colors.white24,
                                  color: Color(0xFFFFB703),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Loading...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 24),
                        const Text(
                          'Excellence in Legal Services',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 💫 Decorative corners
            const Positioned(
              top: 0,
              right: 0,
              child: _CornerDecoration(
                width: 120,
                height: 120,
                color: Color(0x0DFFB703),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: _CornerDecoration(
                width: 120,
                height: 120,
                color: Color(0x0DFFB703),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(120),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CornerDecoration extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final BorderRadius borderRadius;

  const _CornerDecoration({
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
    );
  }
}
