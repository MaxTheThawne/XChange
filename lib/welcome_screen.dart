import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
    const WelcomeScreen();


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(

                child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // First Section
                    Column(
                        children: [
                            // Logo, title, message and exchange design
                            Container(
                                width: 115,
                                height: 115,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xFF07090D),
                                    borderRadius: BorderRadius.circular(28),
                                    border: Border.all(
                                        color: Color(0xFF263044),
                                        width: 1.5,
                                    ),
                                ),
                                child: Text.rich(
                                    TextSpan(
                                        children : [
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
                            SizedBox(height: 35),

                            Text (
                        'Welcome to Xchange',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'monospace',
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text(
                        'Buy what you need.\nSell what you don\'t.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF8193B2),
                            fontFamily: 'monospace',
                            fontSize: 15,
                            height: 1.6,
                        ),
                    ),
                            SizedBox(height: 30),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF2F80FF),
                                            shape: BoxShape.circle,
                                        ),
                                    ),

                                    SizedBox(width: 10),

                                    Container(
                                        width: 80,
                                        height: 5,
                                        color: Color(0xFF263044),
                                    ),
                                    SizedBox(width: 10),

                                    Icon(
                                        Icons.swap_horiz,
                                        color: Color(0xFF52647F),
                                        size: 30,
                                    ),
                                    SizedBox(width: 10),

                                    Container(
                                        width: 80,
                                        height: 5,
                                        color: Color(0xFF263044),
                                    ),
                                    SizedBox(width: 10),

                                    Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                        ),
                                    ),
                                ],
                            ),
                ],
            ),
                    // Second Section
                    Column(
                        children: [
                            // Login, Create Account and Continue as Guest
                            SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                    onPressed: () {

                            },
                                    style : ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF2F80FF),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                    ),
                                    ),
                                child: Text('Login',
                                    style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),

                            ),
                            ),

                            SizedBox(height: 16),

                            SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                    onPressed: () {

                                    },
                                    style : ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF2F80FF),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(13),
                                        ),
                                    ),
                                    child: Text('Create account',
                                        style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),

                                ),
                            ),

                            SizedBox(height: 12),

                            TextButton(
                                onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                        ),
                                    );
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: Color(0xFF2F80FF),
                                ),
                                child: Text(
                                    'Continue as guest',
                                    style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                        ],
                    ),
                    // Bottom tagline
                    Text(
                        'No gimmicks. Just shopping.',
                        style: TextStyle(
                            color: Color(0xFF7185A6),
                            fontFamily: 'monospace',
                            fontSize: 15,
                        ),
                    ),
                ],
                ),
            ),
            ),
        );
    }
}