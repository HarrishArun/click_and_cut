import 'package:click_and_cut/screens/Profile/Screens/profile.dart';
import 'package:click_and_cut/services/locationservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              location(),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 1.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFF6f4fc1),
                        Color(0xFF904088),
                      ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ).createShader(bounds);
                  },
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 15,
                    color: Colors.white,
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
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ProfileDetailScreen(),
                    withNavBar: false,
                  );
                },
                child: CircleAvatar(
                  radius: 18,
                  child: Icon(
                    CupertinoIcons.person_alt_circle,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
