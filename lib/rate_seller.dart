import 'package:flutter/material.dart';

class RateSellerScreen extends StatefulWidget {
  final String sellerName;

  const RateSellerScreen({
    super.key,
    required this.sellerName,
  });

  @override
  State<RateSellerScreen> createState() => _RateSellerScreenState();
}

class _RateSellerScreenState extends State<RateSellerScreen> {

  // The rating selected by the user.
  double selectedRating = 0.0;

  @override
  Widget build(BuildContext context) {
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
            // Go back to Seller Info screen
            Navigator.pop(context);
          },
        ),

        title: Text(
          "Rate ${widget.sellerName}",

          style: const TextStyle(
            fontFamily: "monospace",
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      // MAIN SCREEN

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // QUESTION

              Text(
                "How would you rate ${widget.sellerName}'s\n"
                    "service and product(s)?",

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontFamily: "monospace",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 35),

              // STAR RATING AREA
              SizedBox(
                width: 280,

                child: Column(
                  children: [

                    // FIVE STARS

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(
                        5,
                            (index) {
                          return _buildStar(index);
                        },
                      ),
                    ),

                    const SizedBox(height: 6),

                    // RATING LABELS

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: const [

                        Text(
                          "Very poor",

                          style: TextStyle(
                            fontFamily: "monospace",
                            fontSize: 10,
                            color: Color(0xFF8A96AA),
                          ),
                        ),

                        Text(
                          "Mid",

                          style: TextStyle(
                            fontFamily: "monospace",
                            fontSize: 10,
                            color: Color(0xFF8A96AA),
                          ),
                        ),

                        Text(
                          "Excellent",

                          style: TextStyle(
                            fontFamily: "monospace",
                            fontSize: 10,
                            color: Color(0xFF8A96AA),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 55),

              // SELECTED RATING

              if (selectedRating > 0)
                Text(
                  "${selectedRating.toStringAsFixed(1)} / 5 stars",

                  style: const TextStyle(
                    fontFamily: "monospace",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D7CFF),
                  ),
                ),

              const SizedBox(height: 20),

              // SUBMIT BUTTON

              SizedBox(
                width: 240,
                height: 52,

                child: OutlinedButton(
                  onPressed: () {

                    // We will implement this later.

                  },

                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF2D7CFF),

                    side: const BorderSide(
                      color: Color(0xFF2D7CFF),
                      width: 1.2,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    "SUBMIT REVIEW",

                    style: TextStyle(
                      fontFamily: "monospace",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // STAR

  Widget _buildStar(int index) {


    double fillAmount = selectedRating - index;

    if (fillAmount < 0) {
      fillAmount = 0;
    }

    if (fillAmount > 1) {
      fillAmount = 1;
    }

    return GestureDetector(

      // Detect where the user clicked.
      onTapDown: (TapDownDetails details) {

        // Each star is 50 pixels wide.
        const double starWidth = 50;

        // Find the horizontal position of the click.
        double clickPosition =
            details.localPosition.dx;

        double newRating;

        // Left half = half star
        if (clickPosition < starWidth / 2) {
          newRating = index + 0.5;
        }

        // Right half = full star
        else {
          newRating = index + 1.0;
        }

        // Update the selected rating.
        setState(() {
          selectedRating = newRating;
        });
      },

      child: SizedBox(
        width: 50,
        height: 55,

        child: Stack(
          alignment: Alignment.center,

          children: [

            // EMPTY STAR

            const Icon(
              Icons.star_border,
              size: 50,
              color: Color(0xFF2D7CFF),
            ),

            // FILLED PART OF STAR

            if (fillAmount > 0)

              ClipRect(
                clipper: StarClipper(fillAmount),

                child: const SizedBox(
                  width: 50,
                  height: 55,

                  child: Icon(
                    Icons.star,
                    size: 50,
                    color: Color(0xFF2D7CFF),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class StarClipper extends CustomClipper<Rect> {

  final double fillAmount;

  StarClipper(this.fillAmount);

  @override
  Rect getClip(Size size) {

    return Rect.fromLTWH(
      0,
      0,
      size.width * fillAmount,
      size.height,
    );
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {

    return oldClipper.fillAmount != fillAmount;
  }
}