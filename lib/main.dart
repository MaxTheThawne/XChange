import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XChange',

      // Removes the DEBUG banner.
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050607),
        fontFamily: 'monospace',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2F80FF),
          brightness: Brightness.dark,
        ),
      ),

      // The splash screen opens first.
      home: const SplashScreen(),
    );
  }
}