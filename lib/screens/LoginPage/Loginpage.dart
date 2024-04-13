// import 'package:flutter/material.dart';
// import 'package:woundanalyzer/const.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(kbgwhite),
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.lock,
//               size: 100,
//             ),
//             Text(
//               "WelcomBack To Wound Analyzer",
//               style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 height: 50,
//                 child: TextField(
//                   obscureText: true, // Hide password text
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     "Forgot Password?",
//                     style: TextStyle(color: Colors.black54),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
//               child: Container(
//                 height: 50,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black, // Set text color to white
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 10), // Adjust padding as needed
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.circular(8), // Set button border radius
//                     ),
//                   ),
//                   onPressed: () {
//                     // Add sign-in functionality here
//                   },
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white), // Adjust text size as needed
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               children: [Text("Not a member")],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:click_and_cut/screens/LoginPage/OtploginScreen.dart';
import 'package:click_and_cut/screens/LoginPage/Signuppage.dart';
import 'package:click_and_cut/screens/LoginPage/widgets/orcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../const.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LoginPage> {
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
          Positioned(top: 100, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/logo_bg.png",
                          height: 180,
                          width: 200,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "WoundAnalyzer",
                        //       style: TextStyle(
                        //           fontSize: 22, fontWeight: FontWeight.bold),
                        //     ),
                        //     Icon(
                        //       CupertinoIcons.search,
                        //       size: 22,
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Icon(
                        //       CupertinoIcons.search,
                        //       color: Colors.grey.shade600,
                        //       size: 22,
                        //     ),
                        //     SizedBox(
                        //       width: 2,
                        //     ),
                        // AnimatedTextKit(
                        //   repeatForever: true,
                        //   animatedTexts: [
                        //     TypewriterAnimatedText(
                        //       "WoundAnalyzer",
                        //       //speed: Duration(seconds: 1),
                        //       textStyle: TextStyle(
                        //           fontSize: 22.0,
                        //           fontWeight: FontWeight.w900,
                        //           color: Colors.grey.shade600),
                        //     )
                        //   ],
                        // ),
                        //     ],
                        //   ),
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "WelcomBack To Wound Analyzer",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              height: 50,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 5, 12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(klightpurple),
                    Color(kdarkpurple)
                  ], // Example gradient colors
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          orcontainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Add your Gmail button logic here
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 25,
                      //color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPLoginPage()));
                  // Add your phone button logic here
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.phone,
                    size: 25,
//color: Colors.green,
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
