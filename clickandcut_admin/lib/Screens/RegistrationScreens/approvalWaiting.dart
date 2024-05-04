import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingForApproval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Waiting For Approval!",
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Lottie.asset(
            'assets/Animation - 1714665709911.json', 
            width: 390,
            height: 400,
          ),
          SizedBox(height: 10),
          Text(
            'Waiting For Approval!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
