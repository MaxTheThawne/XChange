import 'package:flutter/material.dart';
import 'seller_info.dart';
import 'buy_now_screen.dart';

class ItemPageScreen extends StatelessWidget {
  final String productName;
  final String sellerName;
  final String sellerEmail;

  final double originalPrice;
  final double discountPercentage;
  final double shippingCharge;

  final int remainingStock;
  final String description;

  const ItemPageScreen({
    super.key,
    required this.productName,
    required this.sellerName,
    required this.sellerEmail,
    required this.originalPrice,
    required this.discountPercentage,
    required this.shippingCharge,
    required this.remainingStock,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double discountAmount =
        originalPrice * discountPercentage / 100;

    double totalPrice =
        originalPrice - discountAmount + shippingCharge;

    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),

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

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Main product image

            Container(
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFF10141D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF202735),
                ),
              ),

              child: Stack(
                children: [

                  const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 100,
                      color: Color(0xFF2D7CFF),
                    ),
                  ),

                  Positioned(
                    left: 15,
                    bottom: 15,

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xFF080A0F),
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: const Text(
                        "2 / 4",
                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 15,
                    bottom: 12,

                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Color(0xFF2D7CFF),
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product name

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

              child: Text(
                productName,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Product images

            SizedBox(
              height: 100,

              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                children: [
                  _productThumbnail("Image 1"),
                  _productThumbnail("Image 2"),
                  _productThumbnail("Image 3"),
                  _productThumbnail("Image 4"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Seller information

            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: const Color(0xFF10141D),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF202735),
                ),
              ),

              child: Row(
                children: [

                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF17233A),
                      border: Border.all(
                        color: const Color(0xFF2D7CFF),
                      ),
                    ),

                    child: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF2D7CFF),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "SELLER",
                          style: TextStyle(
                            fontFamily: "monospace",
                            fontSize: 10,
                            color: Color(0xFF8A96AA),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          sellerName,
                          style: const TextStyle(
                            fontFamily: "monospace",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  OutlinedButton(
                    onPressed: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) {
                            return SellerScreen(
                              sellerName: sellerName,
                              sellerEmail: sellerEmail,
                            );
                          },
                        ),
                      );
                    },

                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                      const Color(0xFF2D7CFF),

                      side: const BorderSide(
                        color: Color(0xFF2D7CFF),
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),

                    child: const Text(
                      "Visit Seller",
                      style: TextStyle(
                        fontFamily: "monospace",
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Price breakdown

            _priceBreakdown(
              originalPrice,
              discountAmount,
              shippingCharge,
              totalPrice,
            ),

            const SizedBox(height: 15),

            // Buy buttons

            _buyButtons(context, totalPrice),

            const SizedBox(height: 30),

            // Remaining stock and description

            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF10141D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF202735),
                ),
              ),

              child: Column(
                children: [

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 14,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF2D7CFF),
                      ),

                      borderRadius:
                      BorderRadius.circular(12),
                    ),

                    child: Text(
                      "Remaining stock: $remainingStock",
                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontFamily: "monospace",
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFF080A0F),
                      borderRadius:
                      BorderRadius.circular(16),

                      border: Border.all(
                        color: const Color(0xFF202735),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "DESCRIPTION",
                          style: TextStyle(
                            fontFamily: "monospace",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D7CFF),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          description,

                          style: const TextStyle(
                            fontFamily: "monospace",
                            fontSize: 12,
                            color: Color(0xFFB0B8C8),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _productThumbnail(String name) {
    return Container(
      width: 85,

      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: const Color(0xFF10141D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF202735),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          const Icon(
            Icons.image_outlined,
            color: Color(0xFF2D7CFF),
            size: 35,
          ),

          const SizedBox(height: 5),

          Text(
            name,

            style: const TextStyle(
              fontFamily: "monospace",
              fontSize: 9,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceBreakdown(
      double originalPrice,
      double discountAmount,
      double shippingCharge,
      double totalPrice,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xFF10141D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF202735),
        ),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const Text(
            "PRICE BREAKDOWN",
            style: TextStyle(
              fontFamily: "monospace",
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D7CFF),
            ),
          ),

          const SizedBox(height: 15),

          _priceRow(
            "Original price",
            originalPrice,
          ),

          _priceRow(
            "Discount",
            -discountAmount,
          ),

          _priceRow(
            "Shipping / Delivery",
            shippingCharge,
          ),

          const Divider(
            color: Color(0xFF202735),
          ),

          _priceRow(
            "Total payable",
            totalPrice,
            isTotal: true,
          ),

          const SizedBox(height: 5),

          const Text(
            "(Figures per Unit)",
            style: TextStyle(
              fontFamily: "monospace",
              fontSize: 9,
              color: Color(0xFF8A96AA),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
      String title,
      double price, {
        bool isTotal = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),

      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: [

          Text(
            title,

            style: TextStyle(
              fontFamily: "monospace",
              fontSize: 11,
              fontWeight: isTotal
                  ? FontWeight.bold
                  : FontWeight.normal,

              color: isTotal
                  ? Colors.white
                  : const Color(0xFFB0B8C8),
            ),
          ),

          Text(
            "\$${price.toStringAsFixed(2)}",

            style: TextStyle(
              fontFamily: "monospace",
              fontSize: 12,
              fontWeight: FontWeight.bold,

              color: isTotal
                  ? const Color(0xFF2D7CFF)
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //Widget _buyButtons()
  Widget _buyButtons(BuildContext context, double totalPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      child: Row(
        children: [

          // BUY NOW button
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BuyNowScreen(
                        productName: productName,
                        pricePerItem: totalPrice,
                      );
                    },
                  ),
                );
              },

              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2D7CFF),

                side: const BorderSide(
                  color: Color(0xFF2D7CFF),
                ),

                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              child: const Text(
                "BUY NOW",
                style: TextStyle(
                  fontFamily: "monospace",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // ADD TO CART button
          Expanded(
            child: OutlinedButton(
              onPressed: () {},

              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2D7CFF),

                side: const BorderSide(
                  color: Color(0xFF2D7CFF),
                ),

                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                  fontFamily: "monospace",
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}