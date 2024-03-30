import 'package:flutter/material.dart';

import '../../../const.dart';

class CartDemoNav extends StatelessWidget {
  const CartDemoNav({
    super.key,
    required String ProfileImage,
    required String TutorFname,
    required String TutorLname,
    required String Qualification,
    required String Rating,
    required String Experience,
    required String Category,
    required String Timeduration,
  })  : _ProfileImage = ProfileImage,
        _TutorFname = TutorFname,
        _TutorLname = TutorLname,
        _Qualification = Qualification,
        _Rating = Rating,
        _Experience = Experience,
        _Category = Category,
        _Timeduration = Timeduration;

  final String _ProfileImage;
  final String _TutorFname;
  final String _TutorLname;
  final String _Qualification;
  final String _Rating;
  final String _Experience;
  final String _Category;
  final String _Timeduration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Add to Cart",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: Color(klightpurple),
                      style: BorderStyle.solid,
                      width: 1)),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => BookDemoStudentsDetailPage(
              //             true,
              //             _ProfileImage,
              //             _TutorFname,
              //             _TutorLname,
              //             _Qualification,
              //             _Rating,
              //             _Experience,
              //             _Category,
              //             _Timeduration)));
            },
            child: Text(
              "Book a demo",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(klightpurple),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: Color(klightpurple),
                      style: BorderStyle.solid,
                      width: 1)),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
