import 'package:flutter/material.dart';

import '../../../const.dart';

class Booknow_Button extends StatelessWidget {
  const Booknow_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment
                      .topLeft, // Define the start point of the gradient
                  end: Alignment
                      .bottomRight, // Define the end point of the gradient
                  colors: [
                    Color(klightpurple), // Start color of the gradient
                    Color(kdarkpurple), // End color of the gradient
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(10), // Add border radius if needed
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                  child: Text(
                "Book Now !",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )),
            ),
          )),
    );
  }
}
