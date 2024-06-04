import 'package:flutter/material.dart';
import 'package:clickandcut_admin/components/appBar.dart';
import 'package:clickandcut_admin/components/bottomNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showAppBar = true;

  void _updateAppBarVisibility(bool isVisible) {
    setState(() {
      _showAppBar = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _showAppBar
            ? AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Appbar(),
              )
            : AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Appbar(isFeedAppbar: true), // Use _FeedAppbar
              ),
        body: BottomNavbar(onPageChanged: _updateAppBarVisibility), // Pass the callback to BottomNavbar
      ),
    );
  }
}
