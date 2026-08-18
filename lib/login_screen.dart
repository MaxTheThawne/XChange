import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050607),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 20,
          ),
          children: [
            // Back button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF8193B2),
                ),
              ),
            ),

            const SizedBox(height: 45),

            // XC logo
            Center(
              child: Container(
                width: 105,
                height: 105,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF07090D),
                  borderRadius: BorderRadius.circular(26),
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
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Login message
            const Text(
              'Sign in to continue to XChange',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8193B2),
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 45),

            // Email or username field
            TextField(
              keyboardType: TextInputType.text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
              decoration: InputDecoration(
                hintText: 'Email or username',
                hintStyle: const TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                ),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF8193B2),
                ),
                filled: true,
                fillColor: const Color(0xFF111318),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFF263044),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFF2F80FF),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Password field
            TextField(
              obscureText: hidePassword,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Color(0xFF8193B2),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF8193B2),
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFF111318),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFF263044),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFF2F80FF),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            // Forgot-password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {

                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFF2F80FF),
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Login button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {

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

            const SizedBox(height: 30),

            // Create-account link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New to XChange?',
                  style: TextStyle(
                    color: Color(0xFF8193B2),
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const CreateAccountScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                      color: Color(0xFF2F80FF),
                      fontFamily: 'monospace',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}