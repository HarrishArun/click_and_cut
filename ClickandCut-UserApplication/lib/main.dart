import 'package:click_and_cut/components/bottomnavbar.dart';
import 'package:click_and_cut/screens/BookingScreen/bookings_screen.dart';
import 'package:click_and_cut/screens/LoginPage/LandingPage.dart';
import 'package:click_and_cut/screens/favourite.dart';
import 'package:click_and_cut/screens/HomeScreen/homepage.dart';
import 'package:click_and_cut/screens/FeedsScreen/FeedsScreen.dart';
import 'package:click_and_cut/screens/more.dart';
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
    Screen1(),
    BookScreen(),
    Screen3(),
    FeedsScreen(),
    Screen5(),
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
