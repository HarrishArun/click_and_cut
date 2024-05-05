import 'package:flutter/material.dart';

class ChairsSelection extends StatefulWidget {
  @override
  _ChairsSelectionState createState() => _ChairsSelectionState();
}

class _ChairsSelectionState extends State<ChairsSelection> {
  int _selectedChairs = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Chairs Selection',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/4116151.jpg', // Path to your illustration asset
                  height: 300, // Adjust height as needed
                ),
                SizedBox(height: 20),
                Text(
                  'Your Chair Count',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_selectedChairs > 1) {
                            _selectedChairs--;
                          }
                        });
                      },
                      color: Colors.black,
                    ),
                    SizedBox(width: 20),
                    Text(
                      _selectedChairs.toString(),
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (_selectedChairs < 25) {
                            _selectedChairs++;
                          }
                        });
                      },
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    // Handle the button click to display the selected number of chairs
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Throne Count'),
                          content: Text(
                            'You have selected $_selectedChairs Chairs.',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Confirm',
                      style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
