import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/Appbar.dart';
import '../../const.dart';

import 'BookingScreenComponents/Parlour_view.dart';
import 'BookingScreenComponents/Saloon_view.dart';
import 'BookingScreenComponents/Search.dart';

class BookScreen extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(kbgwhite),
          appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              //elevation: 2,
              title: Appbar()),
          body: Container(
              //color: Colors.black,
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ListView(
              // scrollDirection: Axis.vertical,
              children: [
                Searchbar(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CupertinoSegmentedControl(
                        children: {
                          0: Text('Saloon'),
                          1: Text(
                            'Parlour',
                            style: TextStyle(
                                //color: Colors.white,
                                ),
                          ),
                        },
                        groupValue: segmentedControlValue,
                        onValueChanged: (value) {
                          setState(() {
                            segmentedControlValue = value;
                          });
                        },
                        borderColor: Color(klightpurple),
                        selectedColor: Color(klightpurple),
                        unselectedColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      if (segmentedControlValue == 0)
                        Saloon_view_booking()
                      else
                        Parlour_view_booking(),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
