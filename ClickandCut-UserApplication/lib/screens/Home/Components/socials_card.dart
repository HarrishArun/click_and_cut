import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class socials_card extends StatelessWidget {
  const socials_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        height: 100,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Follow us on",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.black),
            ),
            IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
