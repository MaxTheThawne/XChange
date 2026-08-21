import 'package:flutter/material.dart';
import 'item_page_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Temporary products
  final List<Map<String, dynamic>> products = const [
    {
      "name": "Final Fantasy X PS2",
      "price": 19.50,
    },
    {
      "name": "Nintendo GameCube Controller",
      "price": 34.00,
    },
    {
      "name": "Sony PlayStation 2",
      "price": 75.00,
    },
    {
      "name": "Nintendo DS Lite",
      "price": 45.00,
    },
    {
      "name": "Xbox 360 Controller",
      "price": 25.00,
    },
    {
      "name": "Game Boy Advance",
      "price": 55.00,
    },
    {
      "name": "PlayStation 1",
      "price": 60.00,
    },
    {
      "name": "Nintendo Wii",
      "price": 80.00,
    },
    {
      "name": "PSP Console",
      "price": 70.00,
    },
    {
      "name": "Sega Genesis",
      "price": 65.00,
    },
    {
      "name": "Nintendo Switch Controller",
      "price": 30.00,
    },
    {
      "name": "Retro Game Collection",
      "price": 40.00,
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

        leading: PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            color: Color(0xFF2D7CFF),
          ),

          itemBuilder: (context) => const [
            PopupMenuItem(
              value: "option1",
              child: Text("Option 1"),
            ),
            PopupMenuItem(
              value: "option2",
              child: Text("Option 2"),
            ),
            PopupMenuItem(
              value: "option3",
              child: Text("Option 3"),
            ),
          ],

          onSelected: (value) {
            // Options will be implemented later.
          },
        ),

        title: GestureDetector(
          onTap: () {
            // Search will be implemented later.
          },

          child: Container(
            height: 42,

            decoration: BoxDecoration(
              color: const Color(0xFF10141D),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF2D7CFF),
              ),
            ),

            child: const Center(
              child: Text(
                "Search Products",
                style: TextStyle(
                  fontFamily: "monospace",
                  fontSize: 12,
                  color: Color(0xFFB0B8C8),
                ),
              ),
            ),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              // Account screen will be implemented later.
            },

            icon: Container(
              width: 45,
              height: 45,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10141D),
                border: Border.all(
                  color: const Color(0xFF2D7CFF),
                ),
              ),

              child: const Icon(
                Icons.person_outline,
                color: Color(0xFF2D7CFF),
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // Product area
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Welcome to XChange!",
              style: TextStyle(
                fontFamily: "monospace",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Product grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: products.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 14,
                mainAxisSpacing: 14,

                childAspectRatio: 0.78,
              ),

              itemBuilder: (context, index) {
                final product = products[index];

                return _buildProductCard(
                  context,
                  product["name"],
                  product["price"],
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

                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    color: Color(0xFF2D7CFF),
                    size: 55,
                  ),
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