import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Ramapuram,Chennai",
                style: TextStyle(
                  fontSize: 15,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        Color(0xFF6f4fc1),
                        Color(0xFF904088), // End color of the gradient
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0,
                        70.0)), // Adjust the Rect size as needed
                ),
              ),
              // SizedBox(
              //   width: 4,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 1.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFF6f4fc1),
                        Color(0xFF904088)
                      ], // Gradient colors
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 15,
                    color: Colors.white, // Color before applying the gradient
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFF6f4fc1),
                        Color(0xFF904088)
                      ], // Gradient colors
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.chat_bubble_2,
                    size: 25,
                    color: Colors.white, // Color before applying the gradient
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFF6f4fc1),
                        Color(0xFF904088)
                      ], // Gradient colors
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.bell_circle_fill,
                    size: 25,
                    color: Colors.white, // Color before applying the gradient
                  ),
                ),
              ),
              CircleAvatar(
                radius: 18,
                child: FaIcon(
                  FontAwesomeIcons.solidUser,
                  size: 13,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
