import 'package:click_and_cut/main.dart';
import 'package:click_and_cut/models/salon.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../const.dart';
import '../../BookingScreen/bookings_screen.dart';
import '../../../components/card.dart';
import '../../../components/seemorecard.dart';
import '../../saloondetails_screen/SaloonDetailsScreen.dart';

class saloon_scroll extends StatefulWidget {
  saloon_scroll({
    super.key,
  });
  @override
  State<saloon_scroll> createState() => _saloon_scrollState();
}

class _saloon_scrollState extends State<saloon_scroll> {
  final List<Salon> salons = [
    Salon(
        image: ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
        name: "Toni and Guy",
        area: "Ramapuram, Chennai",
        offerPercentage: "4.5",
        amount: "15",
        rating: "1000",
        time: "5AM-9AM"),
    Salon(
        image: ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
        name: "Toni and Guy",
        area: "Ramapuram, Chennai",
        offerPercentage: "4.5",
        amount: "15",
        rating: "1000",
        time: "5AM-9AM"),
    Salon(
        image: ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
        name: "Toni and Guy",
        area: "Ramapuram, Chennai",
        offerPercentage: "4.5",
        amount: "15",
        rating: "1000",
        time: "5AM-9AM"),
    Salon(
        image: ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
        name: "Toni and Guy",
        area: "Ramapuram, Chennai",
        offerPercentage: "4.5",
        amount: "15",
        rating: "1000",
        time: "5AM-9AM"),
    Salon(
        image: ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
        name: "Toni and Guy",
        area: "Ramapuram, Chennai",
        offerPercentage: "4.5",
        amount: "15",
        rating: "1000",
        time: "5AM-9AM"),
  ];

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
                    color: Colors.black),
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
              CardWidget(data: salons[0]),
              CardWidget(data: salons[1]),
              CardWidget(data: salons[2]),
              CardWidget(data: salons[3]),
              CardWidget(data: salons[4]),
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
