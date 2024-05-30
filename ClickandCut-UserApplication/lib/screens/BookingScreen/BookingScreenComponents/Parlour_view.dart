import 'package:click_and_cut/models/salon.dart';
import 'package:click_and_cut/screens/saloondetails_screen/SaloonDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../../components/card.dart';

class Parlour_view_booking extends StatelessWidget {
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
  Parlour_view_booking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(data: salons[0]),
        CardWidget(data: salons[1]),
        CardWidget(data: salons[2]),
        CardWidget(data: salons[3]),
        CardWidget(data: salons[4]),
      ],
    );
  }
}
