import 'package:click_and_cut/screens/SlotBooking/slot_booking.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SlotBookingScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:
                    Alignment.topLeft, // Define the start point of the gradient
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
        ));
  }
}
