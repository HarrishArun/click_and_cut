import 'package:click_and_cut/screens/saloondetails_screen/SaloonDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../../components/card.dart';
import '../../../main.dart';

class Parlour_view_booking extends StatelessWidget {
  const Parlour_view_booking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000", HomePage()),
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000", HomePage()),
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000", HomePage()),
      ],
    );
  }
}
