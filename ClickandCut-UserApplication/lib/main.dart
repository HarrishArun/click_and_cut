import 'package:click_and_cut/components/bottom_navbar.dart';
import 'package:click_and_cut/screens/Booking/bookings.dart';
import 'package:click_and_cut/screens/Feeds/feeds.dart';
import 'package:click_and_cut/screens/Landing/landing.dart';
import 'package:click_and_cut/screens/Favourite/favourite.dart';
import 'package:click_and_cut/screens/Home/home.dart';
import 'package:click_and_cut/screens/Profile/profile.dart';
import 'package:click_and_cut/services/locationservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const.dart';

// const klightpurple = 0xFF8340A0;
const kappBarGrey = 0xFF303030;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // Set navigation bar color to black
  ));
  location();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: LandingPage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    HomeScreen(),
    Bookings(),
    Favourites(),
    FeedsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[selectedIndex],
        bottomNavigationBar: bottomnavbar(),
      ),
    );
  }
}
