import 'package:flutter/material.dart';
import 'item_page_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // Change these products later.
  final List<Map<String, dynamic>> favoriteProducts = const [
    {
      "name": "Final Fantasy X PS2",
      "price": 19.50,
      "image": "assets/images/final_fantasy.jpg",
    },
    {
      "name": "Nintendo GameCube Controller",
      "price": 34.00,
      "image": "assets/images/gamecube.jpg",
    },
    {
      "name": "Sony PlayStation 2",
      "price": 75.00,
      "image": "assets/images/ps2.jpg",
    },
    {
      "name": "Nintendo DS Lite",
      "price": 45.00,
      "image": "assets/images/ds_lite.jpg",
    },
    {
      "name": "Xbox 360 Controller",
      "price": 25.00,
      "image": "assets/images/xbox_controller.jpg",
    },
    {
      "name": "Game Boy Advance",
      "price": 55.00,
      "image": "assets/images/gameboy.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),

      // App bar
      appBar: AppBar(
        backgroundColor: const Color(0xFF080A0F),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF2D7CFF),
            size: 20,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "XC Market",
          style: TextStyle(
            fontFamily: "monospace",
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      // Favorites
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Favorites",
              style: TextStyle(
                fontFamily: "monospace",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: favoriteProducts.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 14,
                mainAxisSpacing: 14,

                childAspectRatio: 0.78,
              ),

              itemBuilder: (context, index) {
                final product = favoriteProducts[index];

                return _buildProductCard(
                  context,
                  product["name"],
                  product["price"],
                  product["image"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context,
      String productName,
      double price,
      String imagePath,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (context) {
              return ItemPageScreen(
                productName: productName,

                sellerName: "Cavan N.",
                sellerEmail: "cavan@example.com",

                originalPrice: price,
                discountPercentage: 0,
                shippingCharge: 5.00,

                remainingStock: 10,

                description:
                "This is a temporary product description. "
                    "Real product information will be added later.",
              );
            },
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: const Color(0xFF10141D),

          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: const Color(0xFF202735),
          ),
        ),

        child: Column(
          children: [

            // Product image
            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: const Color(0xFF080A0F),

                  border: Border.all(
                    color: const Color(0xFF2D7CFF),
                  ),

                  borderRadius: BorderRadius.circular(10),
                ),

                child: Image.asset(
                  imagePath,

                  fit: BoxFit.contain,

                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: Color(0xFF2D7CFF),
                        size: 55,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Product name
            Text(
              productName,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 6),

            // Product price
            Text(
              "\$${price.toStringAsFixed(2)}",

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D7CFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}