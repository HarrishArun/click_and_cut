import 'package:flutter/material.dart';

import '../../../const.dart';

class CartDemoNav extends StatelessWidget {
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
            onPressed: () {},
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
