import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const ItemCard({super.key, required this.imageUrl, required this.title,required this.onTap});

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child:Card(
          elevation: 5,

          color: Colors.white,

          child: SizedBox(
            width: 190,
            height: 350,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  width: 160,

                  //color: Colors.green,
                  child: Image.network(imageUrl),
                ),

                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Georgia',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
    );
  }
}
