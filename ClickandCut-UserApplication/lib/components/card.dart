import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

const kappBarGrey = 0xFF4F4F4F; // Define the color value for kappBarGrey

class CardWidget extends StatefulWidget {
  final List<String> image;
  final String name;
  final String area;
  final String offerpercentage;
  final String amount;
  final String rating;
  final Widget nextscreen;

  const CardWidget(this.image, this.name, this.area, this.rating,
      this.offerpercentage, this.amount, this.nextscreen);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isFavorite = false; // Track the favorite state

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: widget.nextscreen,
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino)
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            if (widget.image != null && widget.image.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 120, // Adjust the height as needed
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(widget.image[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite =
                                    !isFavorite; // Toggle favorite state
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              // decoration: BoxDecoration(
                              //   shape: BoxShape.circle,
                              //   color: isFavorite ? Colors.red : Colors.transparent,
                              // ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.greenAccent,
                            ),
                            child: Text(
                              widget.rating + "(5)",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.area,
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 0.4,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 4),
                      child: Row(
                        children: [
                          Text(
                            "Upto" + widget.offerpercentage + "off",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "INR" + widget.amount + " Onwards",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
