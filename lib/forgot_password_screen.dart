import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  bool recoverWithEmail = true;

  final TextEditingController recoveryController =
  TextEditingController();

  @override
  void dispose() {
    recoveryController.dispose();
    super.dispose();
  }

  void selectRecoveryMethod(bool useEmail) {
    setState(() {
      recoverWithEmail = useEmail;
      recoveryController.clear();
    });
  }

  void sendRecoveryRequest() {
    String userInput = recoveryController.text.trim();

    if (userInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            recoverWithEmail
                ? 'Please enter your email address.'
                : 'Please enter your phone number.',
          ),
        ),
      );

      return;
    }


  }

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

            const SizedBox(height: 20),

            // XC logo
            Center(
              child: Container(
                width: 90,
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF07090D),
                  borderRadius: BorderRadius.circular(23),
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
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            const Text(
              'Forgot password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Choose how you want to\nrecover your account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8193B2),
                fontFamily: 'monospace',
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

            // Email and phone selection
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        selectRecoveryMethod(true);
                      },
                      icon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                      ),
                      label: const Text('Email'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: recoverWithEmail
                            ? const Color(0xFF2F80FF)
                            : const Color(0xFF111318),
                        foregroundColor: recoverWithEmail
                            ? Colors.white
                            : const Color(0xFF8193B2),
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFF263044),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        selectRecoveryMethod(false);
                      },
                      icon: const Icon(
                        Icons.phone_outlined,
                        size: 20,
                      ),
                      label: const Text('Phone'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: recoverWithEmail
                            ? const Color(0xFF111318)
                            : const Color(0xFF2F80FF),
                        foregroundColor: recoverWithEmail
                            ? const Color(0xFF8193B2)
                            : Colors.white,
                        elevation: 0,
                        side: const BorderSide(
                          color: Color(0xFF263044),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Email or phone input
            TextField(
              controller: recoveryController,
              keyboardType: recoverWithEmail
                  ? TextInputType.emailAddress
                  : TextInputType.phone,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
              ),
              decoration: InputDecoration(
                hintText: recoverWithEmail
                    ? 'Email address'
                    : 'Phone number',
                hintStyle: const TextStyle(
                  color: Color(0xFF8193B2),
                  fontFamily: 'monospace',
                ),
                prefixIcon: Icon(
                  recoverWithEmail
                      ? Icons.email_outlined
                      : Icons.phone_outlined,
                  color: const Color(0xFF8193B2),
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

            const SizedBox(height: 14),

            Text(
              recoverWithEmail
                  ? 'We\'ll send a secure reset link to your email.'
                  : 'We\'ll send an authentication OTP to your phone.',
              style: const TextStyle(
                color: Color(0xFF8193B2),
                fontFamily: 'monospace',
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 30),

            // Send button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: sendRecoveryRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F80FF),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: Text(
                  recoverWithEmail
                      ? 'Send reset link'
                      : 'Send OTP',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Back to Login
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 18,
              ),
              label: const Text(
                'Back to Login',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF2F80FF),
              ),
            ),

            const SizedBox(height: 70),

            const Icon(
              Icons.verified_user_outlined,
              color: Color(0xFF8193B2),
              size: 35,
            ),

            const SizedBox(height: 12),

            const Text(
              'Secure account recovery',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8193B2),
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}