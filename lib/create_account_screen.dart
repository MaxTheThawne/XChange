import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState
    extends State<CreateAccountScreen> {
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agreedToTerms = false;

  InputDecoration fieldDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xFF8193B2),
        fontFamily: 'monospace',
      ),
      suffixIcon: suffixIcon,
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
    );
  }

  TextStyle get fieldTextStyle {
    return const TextStyle(
      color: Colors.white,
      fontFamily: 'monospace',
    );
  }

  void openLoginScreen() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050607),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 20,
          ),
          children: [
            // Top navigation
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF8193B2),
                  ),
                ),

                const Spacer(),

                // Small XC logo
                Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF07090D),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFF263044),
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -3,
                    ),
                  ),
                ),

                const Spacer(),

                TextButton(
                  onPressed: openLoginScreen,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF2F80FF),
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Create an account',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Join XChange and start buying or selling.',
              style: TextStyle(
                color: Color(0xFF8193B2),
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            // First name and last name
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: fieldTextStyle,
                    decoration: fieldDecoration(
                      hint: 'First name',
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: TextField(
                    style: fieldTextStyle,
                    decoration: fieldDecoration(
                      hint: 'Last name',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Username
            TextField(
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Username',
              ),
            ),

            const SizedBox(height: 16),

            // Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Email',
              ),
            ),

            const SizedBox(height: 16),

            // Phone number
            TextField(
              keyboardType: TextInputType.phone,
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Phone number',
              ),
            ),

            const SizedBox(height: 16),

            // Address
            TextField(
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Address',
              ),
            ),

            const SizedBox(height: 16),

            // Password
            TextField(
              obscureText: hidePassword,
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Password',
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
              ),
            ),

            const SizedBox(height: 16),

            // Confirm password
            TextField(
              obscureText: hideConfirmPassword,
              style: fieldTextStyle,
              decoration: fieldDecoration(
                hint: 'Confirm password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hideConfirmPassword =
                      !hideConfirmPassword;
                    });
                  },
                  icon: Icon(
                    hideConfirmPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF8193B2),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Terms and privacy checkbox
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: agreedToTerms,
                  activeColor: const Color(0xFF2F80FF),
                  checkColor: Colors.white,
                  side: const BorderSide(
                    color: Color(0xFF8193B2),
                  ),
                  onChanged: (value) {
                    setState(() {
                      agreedToTerms = value ?? false;
                    });
                  },
                ),

                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'I agree to the ',
                          style: TextStyle(
                            color: Color(0xFF8193B2),
                          ),
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(
                            color: Color(0xFF2F80FF),
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Color(0xFF8193B2),
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF2F80FF),
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Create-account button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (!agreedToTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please agree to the Terms and Privacy Policy.',
                        ),
                      ),
                    );

                    return;
                  }

                  // Account-creation functionality will be added later.
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
                  'Create account',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Existing-account Login link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Color(0xFF8193B2),
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),

                TextButton(
                  onPressed: openLoginScreen,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF2F80FF),
                      fontFamily: 'monospace',
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