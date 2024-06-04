
import 'package:clickandcut_admin/Screens/HomePage/homePage.dart';
import 'package:clickandcut_admin/Screens/HomePage/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingForApproval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay for 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ApprovalResultScreen()),
      );
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Waiting For Approval!",
      //   ),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Lottie.asset(
              'assets/Animation - 1714665709911.json',
              width: 390,
              height: 350,
            ),

            Text(
              'Waiting For Approval!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}


class ApprovalResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/undraw_Happy_announcement_re_tsm0.png', // Path to your illustration asset
                    height: 200, // Adjust height as needed
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Congratulations!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'You have been approved!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.deepPurple,
                  shadowColor: Colors.deepPurple.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

