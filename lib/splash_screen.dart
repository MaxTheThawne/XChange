import 'dart:async';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeDot = 0;
  Timer? loadingTimer;
  Timer? screenTimer;

  @override
  void initState() {
    super.initState();

    // Changes the active loading dot every 400 milliseconds.
    loadingTimer = Timer.periodic(
      const Duration(milliseconds: 400),
          (timer) {
        if (mounted) {
          setState(() {
            activeDot = (activeDot + 1) % 3;
          });
        }
      },
    );

    screenTimer = Timer(
      const Duration(seconds: 5),
          () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    loadingTimer?.cancel();
    screenTimer?.cancel();
    super.dispose();
  }

  Widget buildLoadingDot(int index) {
    bool isActive = activeDot == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: isActive ? 11 : 8,
      height: isActive ? 11 : 8,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color(0xFF2F80FF)
            : const Color(0xFF263044),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050607),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Spacer(flex: 4),

              // XC logo container
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: const Color(0xFF07090D),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: const Color(0xFF263044),
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'X',
                        style: TextStyle(
                          color: Color(0xFF2F80FF),
                        ),
                      ),
                      TextSpan(
                        text: 'C',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 53,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -5,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Application name
              const Text(
                'XChange',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'monospace',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 14),

              // Application tagline
              const Text(
                'No gimmicks. Just shopping.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                  fontSize: 15,
                  letterSpacing: 0.4,
                ),
              ),

              const SizedBox(height: 42),

              // Exchange symbol
              Row(
                children: [
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2F80FF),
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Divider(
                      color: Color(0xFF263044),
                      thickness: 1,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.swap_horiz,
                      color: Color(0xFF52647F),
                      size: 30,
                    ),
                  ),

                  const Expanded(
                    child: Divider(
                      color: Color(0xFF263044),
                      thickness: 1,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 3),

              // Animated loading dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLoadingDot(0),
                  buildLoadingDot(1),
                  buildLoadingDot(2),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'LOADING MARKETPLACE',
                style: TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                  fontSize: 11,
                  letterSpacing: 1.5,
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}