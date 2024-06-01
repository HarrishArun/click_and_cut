import 'package:click_and_cut/models/salon.dart';
import 'package:flutter/material.dart';

import '../../components/Appbar.dart';
import '../../components/card.dart';
import '../ShopDetails/shop_details.dart';

class Favourites extends StatelessWidget {
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
    return ListView(
      children: [
        Column(
          children: [
            CardWidget(data: salons[0]),
            CardWidget(data: salons[1]),
            CardWidget(data: salons[2]),
            CardWidget(data: salons[3]),
            CardWidget(data: salons[4]),
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
