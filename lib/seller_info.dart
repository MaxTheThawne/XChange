import 'package:flutter/material.dart';
import 'rate_seller.dart';
import 'item_page_screen.dart';

class SellerScreen extends StatelessWidget {
  final String sellerName;
  final String sellerEmail;

  const SellerScreen({
    super.key,
    required this.sellerName,
    required this.sellerEmail,
  });

  final double sellerRating = 4.9;
  final int itemsSold = 36;
  final String memberSince = "June 2026";

  @override
  Widget build(BuildContext context) {

    final List<Product> products = [
      Product(
        name: "Final Fantasy X PS2 NTSC-U",
        price: 19.50,
      ),

      Product(
        name: "Nintendo GameCube Controller",
        price: 34.00,
      ),

      Product(
        name: "PlayStation 2 Console",
        price: 65.00,
      ),

      Product(
        name: "Kingdom Hearts PS2",
        price: 22.50,
      ),

      Product(
        name: "Game Boy Advance",
        price: 58.00,
      ),

      Product(
        name: "Nintendo DS Lite",
        price: 45.00,
      ),
    ];

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
          "Seller Profile",
          style: TextStyle(
            fontFamily: "monospace",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          16,
          30,
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // Seller information

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xFF101522),
                borderRadius:
                BorderRadius.circular(18),

                border: Border.all(
                  color: const Color(0xFF202A3D),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Row(
                    children: [

                      Container(
                        width: 75,
                        height: 75,

                        decoration: BoxDecoration(
                          color: const Color(0xFF1261E8),
                          borderRadius:
                          BorderRadius.circular(18),
                        ),

                        child: Center(
                          child: Text(
                            sellerName[0],

                            style: const TextStyle(
                              fontFamily: "monospace",
                              fontSize: 34,
                              fontWeight:
                              FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Text(
                          sellerName,

                          style: const TextStyle(
                            fontFamily: "monospace",
                            fontSize: 21,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  _infoRow(
                    icon: Icons.email_outlined,
                    label: "EMAIL",
                    value: sellerEmail,
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    icon: Icons.star_outline,
                    label: "AVERAGE SELLER RATING",
                    value:
                    "${sellerRating.toStringAsFixed(1)} / 5",
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    icon:
                    Icons.shopping_bag_outlined,
                    label: "ITEMS SOLD",
                    value: itemsSold.toString(),
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    icon:
                    Icons.calendar_today_outlined,
                    label: "MEMBER SINCE",
                    value: memberSince,
                  ),

                  const SizedBox(height: 22),

                  SizedBox(
                    width: double.infinity,
                    height: 48,

                    child: OutlinedButton(
                      onPressed: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) {
                              return RateSellerScreen(
                                sellerName: sellerName,
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
                          width: 1.2,
                        ),

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      child: const Text(
                        "RATE SELLER",

                        style: TextStyle(
                          fontFamily: "monospace",
                          fontSize: 13,
                          fontWeight:
                          FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // All products

            Row(
              children: [

                Container(
                  width: 4,
                  height: 21,

                  decoration: BoxDecoration(
                    color: const Color(0xFF2D7CFF),
                    borderRadius:
                    BorderRadius.circular(5),
                  ),
                ),

                const SizedBox(width: 9),

                Expanded(
                  child: Text(
                    "ALL PRODUCTS FROM $sellerName",

                    style: const TextStyle(
                      fontFamily: "monospace",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            GridView.builder(
              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),

              itemCount: products.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),

              itemBuilder: (context, index) {

                final product = products[index];

                return _productCard(
                  context,
                  product,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          color: const Color(0xFF2D7CFF),
          size: 19,
        ),

        const SizedBox(width: 11),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                label,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: Color(0xFF687792),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _productCard(
      BuildContext context,
      Product product,
      ) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius:
        BorderRadius.circular(16),

        onTap: () {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) {

                return ItemPageScreen(
                  productName: product.name,

                  sellerName: sellerName,
                  sellerEmail: sellerEmail,

                  originalPrice: product.price,
                  discountPercentage: 10.0,
                  shippingCharge: 5.0,

                  remainingStock: 5,

                  description:
                  "This is a temporary product description. "
                      "The actual product information will be "
                      "added later.",
                );
              },
            ),
          );
        },

        child: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: const Color(0xFF101522),
            borderRadius:
            BorderRadius.circular(16),

            border: Border.all(
              color: const Color(0xFF202A3D),
            ),
          ),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Expanded(
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFF161D2B),
                    borderRadius:
                    BorderRadius.circular(12),
                  ),

                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      color: Color(0xFF2D7CFF),
                      size: 40,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                product.name,

                maxLines: 2,
                overflow:
                TextOverflow.ellipsis,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "\$${product.price.toStringAsFixed(2)}",

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D7CFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  });
}