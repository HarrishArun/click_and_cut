import 'package:click_and_cut/models/salon.dart';
import 'package:click_and_cut/screens/saloondetails_screen/SaloonDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

const kappBarGrey = 0xFF4F4F4F; // Define the color value for kappBarGrey

class CardWidget extends StatefulWidget {
  final Salon data;

  const CardWidget({Key? key, required this.data}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: SaloonDetailsPage(data: widget.data),
            withNavBar: false,
            pageTransitionAnimation: PageTransitionAnimation.cupertino)
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: screenWidth * 0.8,
              height: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height:
                            screenWidth * 0.35, // Adjust the height as needed
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(widget.data.image[0]),
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
                              isFavorite = !isFavorite; // Toggle favorite state
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
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
                          widget.data.name,
                          style: TextStyle(
                            fontSize: 18, // Adjust font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.greenAccent,
                          ),
                          child: Text(
                            widget.data.rating + "(5)",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.data.area,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black), // Adjust font size
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 0.4,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                    child: Row(
                      children: [
                        Text(
                          "Upto " + widget.data.offerPercentage + " off",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black), // Adjust font size
                        ),
                        SizedBox(width: 3),
                        Text(
                          "INR " + widget.data.amount + " Onwards",
                          style: TextStyle(
                            fontSize: 12, // Adjust font size
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
