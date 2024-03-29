import 'package:click_and_cut/components/bottomnavbar.dart';
import 'package:click_and_cut/screens/bookings.dart';
import 'package:click_and_cut/screens/favourite.dart';
import 'package:click_and_cut/screens/homepage.dart';
import 'package:click_and_cut/screens/feed.dart';
import 'package:click_and_cut/screens/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const klightpurple = 0xFF8340A0;
const kappBarGrey = 0xFF303030;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // Set navigation bar color to black
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kappBarGrey),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Ramapuram,Chennai",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 1.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                    child: Icon(
                      Icons.chat_bubble,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 2,
                    ),
                    child: CircleAvatar(
                      radius: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: bottomnavbar(),
    );
  }
}
