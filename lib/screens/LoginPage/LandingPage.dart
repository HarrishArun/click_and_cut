import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:click_and_cut/main.dart';
import 'package:click_and_cut/screens/LoginPage/Signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const.dart';

import 'BottomSheets/loginbuttonand_sheet.dart';
import 'BottomSheets/signup_buttonand_sheet.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Material(
            borderRadius: BorderRadius.circular(25),
            // elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/logo_bg.png",
                      height: 180,
                      width: 200,
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }

  Widget _buildBottom() {
    return Container(
      color: Colors.white,
      height: mediaSize.height / 2,
      width: mediaSize.width,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        //signup
        color: Color(kbgwhite),
        padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
        width: double.infinity,
        child: SignupButtonandSheet(context: context),
      ),
      Container(
          //login
          padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
          width: double.infinity,
          child: LoginbuttonandSheet(
            context: context,
          )),
    ]);
  }
}
