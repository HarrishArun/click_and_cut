import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../const.dart';
import '../../BookingScreen/bookings.dart';
import 'card.dart';
import 'seemorecard.dart';

class saloon_scroll extends StatefulWidget {
  const saloon_scroll({
    super.key,
  });

  @override
  State<saloon_scroll> createState() => _saloon_scrollState();
}

class _saloon_scrollState extends State<saloon_scroll> {
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
                "Book A Saloon Nearby",
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
                      segmentedControlValue = 0;
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
              CardWidget(),
              CardWidget(),
              CardWidget(),
              seeMoreCard("See More Saloons ", () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: BookScreen(),
                  withNavBar: false,
                );
                setState(() {
                  segmentedControlValue = 0;
                });
              }),
            ]),
          ),
        ],
      ),
    );
  }
}
