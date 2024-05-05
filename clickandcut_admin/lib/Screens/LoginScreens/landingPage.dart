
import 'package:clickandcut_admin/Screens/LoginScreens/loginPage.dart';
import 'package:clickandcut_admin/Screens/LoginScreens/signUppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
                      "assets/logo_bg.png",
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
        color: Color.fromARGB(255, 246, 233, 250),
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
        color: Color.fromARGB(255, 246, 233, 250),
        padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent,
                Colors.deepPurple
              ], // Example gradient colors
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              // Set the button's background color to transparent
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.white
                ], // Text gradient colors
              ).createShader(bounds);
            },
            child: Text(
              'Log in',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: Colors.deepPurple,
                width: 1), // Set border color and width
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Set border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          ),
        ),
      ),
    ]);
  }
}
