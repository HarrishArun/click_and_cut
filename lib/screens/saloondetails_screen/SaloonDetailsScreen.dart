import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/screens/saloondetails_screen/Static/RulesAndResPonsibilitiesHeader.dart';
import 'package:click_and_cut/screens/saloondetails_screen/Widgets/CartDemoNav.dart';
import 'package:click_and_cut/screens/saloondetails_screen/Widgets/Carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Static/RulesAndResPonsibilitiesScrollable.dart';

class SaloonDetailsPage extends StatefulWidget {
  final List<String> image;
  final String _ProfileImage;
  final String _TutorFname;
  final String _TutorLname;
  final String _Qualification;
  final String _Rating;
  final String _Experience;
  final String _Category;
  final String _Timeduration;

  SaloonDetailsPage(
    this.image,
    this._ProfileImage,
    this._TutorFname,
    this._TutorLname,
    this._Qualification,
    this._Rating,
    this._Experience,
    this._Category,
    this._Timeduration,
  );

  @override
  State<SaloonDetailsPage> createState() => _SaloonDetailsPageState();
}

class _SaloonDetailsPageState extends State<SaloonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  //  TutorProfileImage(ProfileImage: _ProfileImage),
                  Carousel_slider(widget.image),
                  TutorsNameDetail(
                    TutorFname: widget._TutorFname,
                    TutorLname: widget._TutorLname,
                    Qualification: widget._Qualification,
                    Rating: widget._Rating,
                  ),
                  TutorsExpDetail(
                    Experience: widget._Experience,
                    Category: widget._Category,
                  ),
                  TutorsAddrDetail(),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Row(
                          children: [
                            Text(widget._Timeduration,
                                style: TextStyle(fontSize: 18.5))
                          ],
                        ),
                      ),
                    ],
                  ),
                  RulesAndResPonsibilitiesHeader(),
                  // Expanded(
                  //   child: Container(
                  //     child: RulesAndResPonsibilitiesScrollable(
                  //         tutorResponsibilities: tutorResponsibilities),
                  //   ),
                  // ),
                ],
              ),
            ),
            // Other widgets as needed
          ],
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: CartDemoNav(
                ProfileImage: widget._ProfileImage,
                TutorFname: widget._TutorFname,
                TutorLname: widget._TutorLname,
                Qualification: widget._Qualification,
                Rating: widget._Rating,
                Experience: widget._Experience,
                Category: widget._Category,
                Timeduration: widget._Timeduration),
          ),
        ),
      ),
    );
  }
}

class TutorProfileImage extends StatelessWidget {
  const TutorProfileImage({
    super.key,
    required String ProfileImage,
  }) : _ProfileImage = ProfileImage;

  final String _ProfileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF008080), // Dark teal
            Color(0xFF00CED1), // Light teal
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Image.asset(
              _ProfileImage,
            ),
          ),
          Positioned(
            top: 20.0,
            right: 30.0,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TutorsAddrDetail extends StatelessWidget {
  const TutorsAddrDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 3),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 17,
              ),
              Text(
                "Address",
                style: TextStyle(fontSize: 18.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TutorsExpDetail extends StatelessWidget {
  const TutorsExpDetail({
    super.key,
    required String Experience,
    required String Category,
  })  : _Experience = Experience,
        _Category = Category;

  final String _Experience;
  final String _Category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          _Experience,
          style: TextStyle(fontSize: 18.5),
        ),
        Row(
          children: [
            Text(
              _Category,
              style: TextStyle(fontSize: 18.5),
            ),
          ],
        )
      ]),
    );
  }
}

class TutorsNameDetail extends StatelessWidget {
  const TutorsNameDetail({
    super.key,
    required String TutorFname,
    required String TutorLname,
    required String Qualification,
    required String Rating,
  })  : _TutorFname = TutorFname,
        _TutorLname = TutorLname,
        _Qualification = Qualification,
        _Rating = Rating;

  final String _TutorFname;
  final String _TutorLname;
  final String _Qualification;
  final String _Rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 3, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              _TutorFname + _TutorLname,
              style: TextStyle(fontSize: 20.0, color: Color(klightpurple)),
            ),
            SizedBox(width: 5.0),
            Text(_Qualification)
          ]),
          Row(
            children: [
              Text(
                _Rating,
                style: TextStyle(fontSize: 18.5),
              ),
              SizedBox(
                width: 2,
              ),
              FaIcon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15,
              )
            ],
          )
        ],
      ),
    );
  }
}
