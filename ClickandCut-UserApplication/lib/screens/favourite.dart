import 'package:flutter/material.dart';

import '../components/Appbar.dart';
import '../components/card.dart';
import 'saloondetails_screen/SaloonDetailsScreen.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: TabViewScreen());
  }
}

class TabViewScreen extends StatelessWidget {
  final List<String> _tabs = ['Favorites', 'Saved'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          //elevation: 2,
          title: Appbar(),
          bottom: TabBar(
            tabs: _tabs.map((String tab) {
              return Tab(text: tab);
            }).toList(),
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              FavoritesTab(),
              SavedTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
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
        ),
      ],
    );
  }
}

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Saved Tab Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
