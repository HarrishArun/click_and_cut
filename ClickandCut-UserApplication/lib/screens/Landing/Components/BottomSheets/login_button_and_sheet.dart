import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginbuttonandSheet extends StatelessWidget {
  const LoginbuttonandSheet({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (BuildContext context,
                  StateSetter setState /*You can rename this!*/) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    color: Color(kbgwhite),
                    // height: mediaSize.height / 2,
                    // width: mediaSize.width,
                    child: Container(
                      color: Color(kbgwhite),
                      // shape: const RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //         // topLeft: Radius.circular(30),
                      //         //topRight: Radius.circular(30),
                      //         )),
                      child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "WelcomBack To Wound Analyzer",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 5, 5, 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 5, 5, 12),
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
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 5, 5, 12),
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(kbluepastle),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      },
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
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
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.mail,
                                          size: 25,
                                          //color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: () {
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
                                              color:
                                                  Colors.black.withOpacity(0.2),
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
                                // TextButton(
                                //   onPressed: () {},
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Text(
                                //         'New User?',
                                //         style: TextStyle(color: Colors.black),
                                //       ),
                                //       SizedBox(
                                //         width: 5,
                                //       ),
                                //       Text(
                                //         'Sign Up',
                                //         style: TextStyle(color: Colors.blue),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ])),
                    ),
                  ),
                );
              });
            });
      },
      child: Text(
        'Log in',
        style: TextStyle(
            color: Color(kbluepastle),
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            color: Color(kbluepastle), width: 1), // Set border color and width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set border radius
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      ),
    );
  }
}

class PhoneAuthBottomSheet extends StatelessWidget {
  const PhoneAuthBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(kbgwhite),
        child: Container(
          color: Color(kbgwhite),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Phone Authentication",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
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
                        hintText: 'Phone Number',
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
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'OTP',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your phone authentication logic here
                      print('Phone Authenticated!');
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
