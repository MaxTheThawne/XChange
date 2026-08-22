import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'create_account_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050607),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
          ),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // XC logo
              Container(
                width: 115,
                height: 115,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF07090D),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: const Color(0xFF263044),
                    width: 1.5,
                  ),
                ),
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
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -5,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // Welcome title
              const Text(
                'Welcome to XChange',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'monospace',
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Welcome message
              const Text(
                'Buy what you need.\nSell what you don\'t.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                  fontSize: 15,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 30),

              // Exchange design
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2F80FF),
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Divider(
                      color: Color(0xFF263044),
                      thickness: 1,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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

                  const SizedBox(width: 10),

                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2F80FF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Create-account button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF2F80FF),
                    side: const BorderSide(
                      color: Color(0xFF2F80FF),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Continue-as-guest button
              TextButton.icon(
                onPressed: () {
                  // Home screen navigation will be added later.
                },
                label: const Text(
                  'Continue as guest',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2F80FF),
                ),
              ),

              const Spacer(),

              const Text(
                'No gimmicks. Just shopping.',
                style: TextStyle(
                  color: Color(0xFF7185A6),
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}