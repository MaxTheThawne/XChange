import 'package:flutter/material.dart';
import 'item_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 40, 120),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.blue,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          'XChange',
          style: TextStyle(fontFamily: 'Georgia', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: double.infinity, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(width: 350),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Georgia',
                    fontSize: 20,
                  ),
                ),
                //SizedBox(width: 100, height: 50)
              ],
            ),
            SizedBox(width: 100, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //no1
                ItemCard(
                  imageUrl:
                      'https://mustafacomputers.pk/cdn/shop/files/all_colors__flhn5cmb1t26_large_16520892-84e4-40ef-ae01-e6341d6330fa.jpg?v=1737881165',
                  title: 'iPhone 16',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl: 'https://mustafacomputers.pk/cdn/shop/files/all_colors__flhn5cmb1t26_large_16520892-84e4-40ef-ae01-e6341d6330fa.jpg?v=1737881165',title:'iPhone16'))
                      );
                    },
                    ),
                //no2
                ItemCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnJ1tIvE1xjISkMrhj33X8qMXRgdtjtcATYnTaoZB3rg&s=10',
                  title: 'BMW M6',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnJ1tIvE1xjISkMrhj33X8qMXRgdtjtcATYnTaoZB3rg&s=10',title:'BMW M6'))
                      );
                    }
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //no3
                ItemCard(
                  imageUrl:
                      'https://gtspirit.com/wp-content/uploads/2018/05/BMW-F90-M5-Competition-4.jpg',
                  title: 'BMW M5',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl:'https://gtspirit.com/wp-content/uploads/2018/05/BMW-F90-M5-Competition-4.jpg',title:'BMW M5'))
                      );
                    }
                ),
                //no4
                ItemCard(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyviePnVr1FNcPRU2x5hRoD0PtiRmIfNK09QzyUMnZXVoGjP00SI8K6is&s=10',
                  title: 'BMW M4',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyviePnVr1FNcPRU2x5hRoD0PtiRmIfNK09QzyUMnZXVoGjP00SI8K6is&s=10',
                            title: 'BMW M4',
                          ))
                      );
                    }
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //no5
                ItemCard(
                  imageUrl:
                  'https://carsales.pxcrush.net/car/cil/bmw%202x2y.jpg?pxc_method=GravityFill&width=480&height=320&watermark=1039337366',
                  title: 'BMW M4',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl:
                          'https://carsales.pxcrush.net/car/cil/bmw%202x2y.jpg?pxc_method=GravityFill&width=480&height=320&watermark=1039337366',
                            title: 'BMW M4',
                          ))
                      );
                    }
                ),
                //no6
                ItemCard(
                  imageUrl:
                  'https://img.magnific.com/premium-photo/photorealistic-hyper-realistic-image-white-background-ai-generated-by-freepik_643360-536430.jpg?semt=ais_hybrid&w=740&q=80',
                  title: 'BMW M5',
                    onTap:()
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>DetailsScreen(imageUrl:
                          'https://img.magnific.com/premium-photo/photorealistic-hyper-realistic-image-white-background-ai-generated-by-freepik_643360-536430.jpg?semt=ais_hybrid&w=740&q=80',
                            title: 'BMW M5',
                          ))
                      );
                    }
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
