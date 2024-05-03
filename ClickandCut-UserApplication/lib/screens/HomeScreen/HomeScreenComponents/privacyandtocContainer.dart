import 'package:flutter/material.dart';

import '../../../const.dart';

class PrivacyandtosContainer extends StatelessWidget {
  const PrivacyandtosContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "PrivacyPolicy",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(klightpurple)),
                )),
            Text(
              ".",
              style: TextStyle(
                  color: Color(klightpurple),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(klightpurple)),
                )),
            Row(
              children: [
                Text(
                  ".",
                  style: TextStyle(
                      color: Color(klightpurple),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "FAQs",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(klightpurple)),
                )),
          ],
        ));
  }
}
