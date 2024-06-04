import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart'; // Ensure this is imported if needed

class Appbar extends StatefulWidget {
  final bool isFeedAppbar;

  const Appbar({Key? key, this.isFeedAppbar = false}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFeedAppbar) {
      return _FeedAppbar();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/4116151.jpg'), // Replace with your image URL or AssetImage
                ),
                SizedBox(width: 10.0), // Add some space between the image and the text
                Text(
                  'Cheap&Best', // Replace with your shop name
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple, // Customize text color
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
                          Color(0xFF904088),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds);
                    },
                    child: Icon(
                      CupertinoIcons.chat_bubble_2,
                      size: 25,
                      color: Colors.white,
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
                          Color(0xFF904088),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds);
                    },
                    child: Icon(
                      CupertinoIcons.bell_circle_fill,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                
              ],
            ),
          )
        ],
      );
    }
  }
}

class _FeedAppbar extends StatefulWidget {
  @override
  _FeedAppbarState createState() => _FeedAppbarState();
}

class _FeedAppbarState extends State<_FeedAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              // CircleAvatar(
              //   radius: 20,
              //   backgroundImage: AssetImage('assets/4116151.jpg'), // Replace with your image URL or AssetImage
              // ),
              // SizedBox(width: 10.0), // Add some space between the image and the text
              Text(
                'Cheap&Best', // Replace with your shop name
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple, // Customize text color
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
                        Color(0xFF904088),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.chat_bubble_2,
                    size: 25,
                    color: Colors.white,
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
                        Color(0xFF904088),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.bell_circle_fill,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
