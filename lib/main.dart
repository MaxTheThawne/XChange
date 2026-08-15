import 'package:flutter/material.dart';
import 'seller_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XChange',

      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'monospace',
      ),

      home: const SellerScreen(),
    );
  }
}