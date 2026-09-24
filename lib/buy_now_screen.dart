import 'package:flutter/material.dart';

class BuyNowScreen extends StatefulWidget {
  final String productName;
  final double pricePerItem;

  const BuyNowScreen({
    super.key,
    required this.productName,
    required this.pricePerItem,
  });

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {

  // Number of items the user wants
  int quantity = 1;

  // Text entered by the user
  final TextEditingController preferenceController =
  TextEditingController();

  @override
  void dispose() {
    preferenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Calculate total price
    double totalPrice = widget.pricePerItem * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),

      // APP BAR

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
            // Go back to the item page
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

      // MAIN CONTENT

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // BUY PRODUCT TITLE

            Text(
              "Buy ${widget.productName}",
              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // COLOR / SIZE TEXT BOX

            TextField(
              controller: preferenceController,

              maxLines: 5,

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 14,
                color: Colors.white,
              ),

              decoration: InputDecoration(
                hintText:
                "Specify preferred color and/or\n"
                    "size (if applicable)...",

                hintStyle: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 14,
                  color: Color(0xFF8A96AA),
                ),

                filled: true,
                fillColor: const Color(0xFF10141D),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Color(0xFF2D7CFF),
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Color(0xFF2D7CFF),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // CONTACT INFORMATION NOTE

            const Text(
              "*Your provided contact information and address will "
                  "be used for delivery purposes.",

              style: TextStyle(
                fontFamily: "monospace",
                fontSize: 10,
                color: Color(0xFF8A96AA),
              ),
            ),

            const SizedBox(height: 25),

            // QUANTITY

            Row(
              children: [

                const Text(
                  "Quantity:",
                  style: TextStyle(
                    fontFamily: "monospace",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 15),

                Container(
                  height: 45,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF2D7CFF),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Row(
                    children: [

                      // Minus button
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Color(0xFF2D7CFF),
                        ),

                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),

                      // Quantity number
                      Text(
                        "$quantity",
                        style: const TextStyle(
                          fontFamily: "monospace",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Plus button
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF2D7CFF),
                        ),

                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // PRICE PER ITEM

            Text(
              "Per item payable: \$${widget.pricePerItem.toStringAsFixed(2)}",

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 15,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            // TOTAL PRICE

            Text(
              "Total: \$${totalPrice.toStringAsFixed(2)}",

              style: const TextStyle(
                fontFamily: "monospace",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D7CFF),
              ),
            ),

            const SizedBox(height: 35),

            // PAYMENT METHOD

            const Center(
              child: Text(
                "Select your payment method:",

                style: TextStyle(
                  fontFamily: "monospace",
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // COD AND CARD BUTTONS

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Functionality will be added later.
                    },

                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2D7CFF),

                      side: const BorderSide(
                        color: Color(0xFF2D7CFF),
                        width: 1.2,
                      ),

                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    child: const Text(
                      "COD",
                      style: TextStyle(
                        fontFamily: "monospace",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Functionality will be added later.
                    },

                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2D7CFF),

                      side: const BorderSide(
                        color: Color(0xFF2D7CFF),
                        width: 1.2,
                      ),

                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    child: const Text(
                      "Card",
                      style: TextStyle(
                        fontFamily: "monospace",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}