import 'package:click_and_cut/screens/saloondetails_screen/SaloonDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../../components/card.dart';

class Saloon_view_booking extends StatelessWidget {
  const Saloon_view_booking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(
            ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy",
            "Ramapuram",
            "4.5",
            "15",
            "1000",
            SaloonDetailsPage(
              ["lib/assets/img1.jpeg", "lib/assets/img2.jpeg"],
              "Toni and Guy",
              "5AM-9PM",
              "Ramapuram,Chennai",
            )),
        CardWidget(
            ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy",
            "Ramapuram",
            "4.5",
            "15",
            "1000",
            SaloonDetailsPage(
              ["lib/assets/img1.jpeg", "lib/assets/img2.jpeg"],
              "Toni and Guy",
              "5AM-9PM",
              "Ramapuram,Chennai",
            )),
        CardWidget(
            ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy",
            "Ramapuram",
            "4.5",
            "15",
            "1000",
            SaloonDetailsPage(
              ["lib/assets/img1.jpeg", "lib/assets/img2.jpeg"],
              "Toni and Guy",
              "5AM-9PM",
              "Ramapuram,Chennai",
            )),
        CardWidget(
            ["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy",
            "Ramapuram",
            "4.5",
            "15",
            "1000",
            SaloonDetailsPage(
              ["lib/assets/img1.jpeg", "lib/assets/img2.jpeg"],
              "Toni and Guy",
              "5AM-9PM",
              "Ramapuram,Chennai",
            )),
      ],
    );
  }
}
