import 'package:click_and_cut/screens/BookingScreen/bookings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../const.dart';
import 'card.dart';
import 'seemorecard.dart';

class parlour_scroll extends StatefulWidget {
  const parlour_scroll({
    super.key,
  });

  @override
  State<parlour_scroll> createState() => _parlour_scrollState();
}

class _parlour_scrollState extends State<parlour_scroll> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Book A Parlour Nearby",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: BookScreen(),
                      withNavBar: false,
                    );
                    setState(() {
                      segmentedControlValue = 1;
                    });
                  },
                  child: Text(
                    "SEE ALL >",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            Color(0xFF6f4fc1),
                            Color(0xFF904088), // End color of the gradient
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 250,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
                  "Toni and Guy", "Ramapuram", "4.5", "15", "1000"),
              CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
                  "Toni and Guy", "Ramapuram", "4.5", "15", "1000"),
              seeMoreCard(
                "See More Parlour ",
                () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: BookScreen(),
                    withNavBar: false,
                  );
                  setState(() {
                    segmentedControlValue = 1;
                  });
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
