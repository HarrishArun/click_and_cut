import 'package:click_and_cut/components/bottomnavbar.dart';
import 'package:click_and_cut/screens/HomeScreen/HomeScreenComponents/logo_containerr.dart';
import 'package:click_and_cut/screens/HomeScreen/homepage.dart';
import 'package:click_and_cut/screens/favourite.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../const.dart';
import 'HomeScreen/HomeScreenComponents/card.dart';
import 'feed.dart';
import 'more.dart';

class BookScreen extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  logo_containerr(),
                  CardWidget(),
                  CardWidget(),
                  CardWidget(),
                  CardWidget(),
                  CardWidget(),
                ],
              ),
            )));
  }
}
