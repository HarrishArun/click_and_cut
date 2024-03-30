import 'package:flutter/material.dart';

import '../../HomeScreen/HomeScreenComponents/card.dart';

class Saloon_view_booking extends StatelessWidget {
  const Saloon_view_booking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(),
        CardWidget(),
        CardWidget(),
        CardWidget(),
        CardWidget(),
        CardWidget(),
      ],
    );
  }
}
