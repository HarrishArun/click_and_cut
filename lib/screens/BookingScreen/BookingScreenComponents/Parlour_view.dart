import 'package:flutter/material.dart';

import '../../HomeScreen/HomeScreenComponents/card.dart';

class Parlour_view_booking extends StatelessWidget {
  const Parlour_view_booking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000"),
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000"),
        CardWidget(["lib/assets/img1.jpeg", "lib/assets/img1.jpeg"],
            "Toni and Guy", "Ramapuram", "4.5", "15", "1000"),
      ],
    );
  }
}
