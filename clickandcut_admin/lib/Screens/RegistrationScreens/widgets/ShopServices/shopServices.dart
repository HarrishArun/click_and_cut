import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/ShopServices/ServicesContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopServices extends StatefulWidget {
  @override
  State<ShopServices> createState() => _ShopServicesState();
}

class _ShopServicesState extends State<ShopServices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      // color: Colors.amber,
      child: Column(
        children: [
          SizedBox(height: 15,),
          Container(
            height:70,
            width: 360,
            // color: Colors.amber,
            child:Column(
              children: [
                // SizedBox( height: 15,),
                Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        // decoration: BoxDecoration(
                        //   border: Border(
                        //     bottom: BorderSide(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   borderRadius: BorderRadius.circular(15),
                        //   color: Colors.white,
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Services",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "See all",
                            //       style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(top: 4.0),
                            //       child: Icon(CupertinoIcons.chevron_forward),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          ServicesContainer(),
          // SizedBox(height:40,),
          // ElevatedButton(
          //     onPressed: () {
          //       // Handle the button click to display the selected number of chairs
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: Text('Selected Chairs'),
          //             content: Text(
          //               'Services Selected',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //             actions: [
          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //                 child: Text(
          //                   'OK',
          //                   style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          //                 ),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //       child: Text(
          //         'Confirm',
          //         style: TextStyle(fontSize: 15, color: Colors.white), // Added color here
          //       ),
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //       // Removed primary here
          //     ),
          //   ),


        ],
      ),
    );
  }
}