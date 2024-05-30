import 'package:click_and_cut/components/Appbar.dart';
import 'package:click_and_cut/screens/HomeScreen/HomeScreenComponents/illustration.dart';
import 'package:click_and_cut/screens/HomeScreen/HomeScreenComponents/parlour_scroll.dart';
import 'package:click_and_cut/screens/HomeScreen/HomeScreenComponents/saloon_scroll.dart';

import 'package:flutter/material.dart';

import 'HomeScreenComponents/logo_containerr.dart';
import 'HomeScreenComponents/privacyandtocContainer.dart';

import 'HomeScreenComponents/socials_card.dart';
import '../../const.dart';
import 'HomeScreenComponents/version_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        //elevation: 2,
        title: Appbar(),
      ),
      backgroundColor: Color(kbgwhite),
      body: Container(
        //color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            saloon_scroll(),
            parlour_scroll(),
            socials_card(),
            logo_containerr(),
            PrivacyandtosContainer(),
            version_container(),
            SizedBox(
              height: 5,
            ),
            illustration(),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
