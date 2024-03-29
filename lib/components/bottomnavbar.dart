import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/screens/bookings.dart';
import 'package:click_and_cut/screens/favourite.dart';
import 'package:click_and_cut/screens/homepage.dart';
import 'package:click_and_cut/screens/more.dart';
import 'package:click_and_cut/screens/feed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class bottomnavbar extends StatelessWidget {
  const bottomnavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: [
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
        Screen5(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          title: 'Home',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: FaIcon(
            FontAwesomeIcons.scissors,
            size: 20,
          ),
          title: 'Book',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.favorite,
            size: 25,
          ),
          title: 'Favorite',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.newspaper,
            size: 25,
          ),
          title: 'Feed',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.more_horiz,
            size: 25,
          ),
          title: 'More',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Color(kappBarGrey),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
        gradient: LinearGradient(
          colors: [
            Color(0xFF6f4fc1),
            Color(0xFF904088),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
