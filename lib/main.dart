import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      // Handle navigation here
      // You can use setState() to rebuild the widget with the new index
    }
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            //elevation: 2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Ramapuram,Chennai",
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
            )),
        body: Container(
          color: Colors.black12,
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
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Border radius
                          // Dotted border style
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
                          "SEE MORE VENEUES",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )))),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
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
        ));
  }
}

class card extends StatelessWidget {
  const card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 140,
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
                  "Ekkatuthangal(~2.31kms)",
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
                          fontWeight: FontWeight.bold),
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
