import 'package:flutter/material.dart';

class AddToCartScreen extends StatefulWidget {
  final String productName;
  final double pricePerItem;

  const AddToCartScreen({
    super.key,
    required this.productName,
    required this.pricePerItem,
  });

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  // The quantity starts at 1.
  int quantity = 1;

  // Controller for the color/size text box.
  final TextEditingController detailsController =
  TextEditingController();

  @override
  void dispose() {
    // Cleans up the controller when this screen is closed.
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Final payable amount.
    double finalPayable = widget.pricePerItem * quantity;

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
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // Page title

            Text(
              "Add ${widget.productName} to cart",
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Color and size input box

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFF10141D),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF202735),
                ),
              ),

              child: TextField(
                controller: detailsController,

                maxLines: 6,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 13,
                  color: Colors.white,
                ),

                decoration: const InputDecoration(
                  hintText:
                  "Specify color and/or size\n(if applicable)",

                  hintStyle: TextStyle(
                    fontFamily: "monospace",
                    fontSize: 13,
                    color: Color(0xFF8A96AA),
                    height: 1.5,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Delivery information

            const Text(
              "*Your provided contact information and\n"
                  "address will be used for delivery purposes.*",

              textAlign: TextAlign.center,

              style: TextStyle(
                fontFamily: "monospace",
                fontSize: 11,
                color: Color(0xFFB0B8C8),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // Quantity section

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "Quantity:",
                  style: TextStyle(
                    fontFamily: "monospace",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF2D7CFF),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Row(
                    children: [

                      // Minus button

                      IconButton(
                        onPressed: () {
                          // Quantity cannot go below 1.
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },

                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF2D7CFF),
                        ),
                      ),

                      Text(
                        quantity.toString(),

                        style: const TextStyle(
                          fontFamily: "monospace",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Plus button

                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },

                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF2D7CFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Price information

            _priceRow(
              "Per unit payable:",
              widget.pricePerItem,
            ),

            const SizedBox(height: 12),

            _priceRow(
              "Final payable:",
              finalPayable,
              isTotal: true,
            ),

            const SizedBox(height: 30),

            // Add to cart button

            SizedBox(
              width: double.infinity,

              child: OutlinedButton(
                onPressed: () {
                  // Cart functionality will be added later.
                },

                style: OutlinedButton.styleFrom(
                  foregroundColor:
                  const Color(0xFF2D7CFF),

                  side: const BorderSide(
                    color: Color(0xFF2D7CFF),
                  ),

                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  "ADD TO CART",

                  style: TextStyle(
                    fontFamily: "monospace",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A reusable row for displaying prices.

  Widget _priceRow(
      String title,
      double price, {
        bool isTotal = false,
      }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,

      children: [

        Text(
          title,

          style: TextStyle(
            fontFamily: "monospace",
            fontSize: 13,

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
            fontSize: 14,
            fontWeight: FontWeight.bold,

            color: isTotal
                ? const Color(0xFF2D7CFF)
                : Colors.white,
          ),
        ),
      ],
    );
  }
}