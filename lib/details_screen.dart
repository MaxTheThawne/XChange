import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  const DetailsScreen({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 30, 122),
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          'XChange',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Georgia',
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Image.network(imageUrl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
