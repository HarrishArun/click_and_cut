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
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Throne Count',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
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
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
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
              ElevatedButton(
                onPressed: () {
                  // Handle the button click to display the selected number of chairs
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Throne Count'),
                        content: Text(
                          'You have selected $_selectedChairs throne(s).',
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            height: 300,
            width: 360,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/furniture.png'), // Use a majestic background image
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
