import 'package:click_and_cut/main.dart';
import 'package:flutter/material.dart';

class seeMoreCard extends StatelessWidget {
  final String text;
  final VoidCallback next;
  seeMoreCard(this.text, this.next);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: Color(kappBarGrey),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  spreadRadius: 1,
                ),
              ],
            ),
            height: 140,
            width: 280,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey),
            ))));
  }
}
