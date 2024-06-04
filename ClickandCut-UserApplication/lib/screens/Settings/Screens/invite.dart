import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';

class InviteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Invite and Earn",
          style: TextStyle(
            fontSize: 20,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Color(0xFF6f4fc1),
                  Color(0xFF904088),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              'lib/assets/gift.jpg', // replace with your image file
              height: 200,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Color(kdarkpurple),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                'Refer friends and earn money',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(klightpurple),
                        Color(kdarkpurple),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "Invite !",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
                ),
              )),
        ],
      ),
    );
  }
}
