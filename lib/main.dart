import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const klightpurple = 0xFF8340A0;

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
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Ramapuram, Chennai",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  FaIcon(
                    FontAwesomeIcons.caretDown,
                    size: 15,
                    color: Colors.black87,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidMessage,
                    color: Colors.black87,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  FaIcon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  CircleAvatar(
                    radius: 15,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: SizedBox(
            height: 250,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              card(),
              card(),
              card(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10), // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  height: 140,
                  width: 280,
                  child: Center(
                    child: Text(
                      "SEE MORE VENUES",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors
              .black, // sets the background color of the `BottomNavigationBar`
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(
                    color: Colors
                        .yellow), // sets the inactive color of the `BottomNavigationBar`
              ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Color(
              klightpurple), // sets the active color of the `BottomNavigationBar`
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.scissors),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 280,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "lib/assets/img1.jpeg",
                  // fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ruckus Herkley",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.greenAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "4.5 (2)",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0,
                  4,
                  8,
                  4,
                ),
                child: Text(
                  "Ekkatuthangal (~2.31kms)",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0,
                  4,
                  8,
                  4,
                ),
                child: Container(
                  height: 0.4,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  8.0,
                  4,
                  8,
                  4,
                ),
                child: Row(
                  children: [
                    Text(
                      "Upto 25% off",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "INR 800 Onwards",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
