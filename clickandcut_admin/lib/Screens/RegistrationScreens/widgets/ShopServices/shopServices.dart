import 'package:clickandcut_admin/Screens/RegistrationScreens/widgets/ShopServices/ServicesContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopServices extends StatelessWidget {
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
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepPurple,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Services",
                              style: TextStyle(
                                  color: Colors.white,
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


        ],
      ),
    );
  }
}