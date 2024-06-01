import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/screens/Booking/bookings.dart';
import 'package:click_and_cut/screens/Feeds/feeds.dart';
import 'package:click_and_cut/screens/Favourite/favourite.dart';
import 'package:click_and_cut/screens/Home/home.dart';
import 'package:click_and_cut/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({
    super.key,
  });

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: [
        HomeScreen(),
        Bookings(),
        Favourites(),
        FeedsScreen(),
        ProfileScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          // title: 'Home',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: FaIcon(
            FontAwesomeIcons.scissors,
            size: 20,
          ),
          //  title: 'Book',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.favorite,
            size: 25,
          ),
          //  title: 'Favorite',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.newspaper,
            size: 25,
          ),
          // title: 'Feed',
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.more_horiz,
            size: 25,
          ),
          // title: 'More',
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
          colors: [Color(klightpurple), Color(kdarkpurple)],
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
