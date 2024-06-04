import 'package:click_and_cut/components/Appbar.dart';
import 'package:click_and_cut/screens/Home/Components/illustration.dart';
import 'package:click_and_cut/screens/Home/Components/parlour_scroll.dart';
import 'package:click_and_cut/screens/Home/Components/saloon_scroll.dart';

import 'package:flutter/material.dart';

import 'Components/logo_containerr.dart';
import 'Components/privacy_toc_container.dart';

import 'Components/socials_card.dart';
import '../../const.dart';
import 'Components/version_container.dart';

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
