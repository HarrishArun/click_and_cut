import 'package:flutter/material.dart';

class ChairsSelection extends StatefulWidget {
  @override
  _ChairsSelectionState createState() => _ChairsSelectionState();
}

class _ChairsSelectionState extends State<ChairsSelection> {
  int _selectedChairs = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How many chairs do you have?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
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
                ),
                SizedBox(width: 20),
                Text(
                  _selectedChairs.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      title: Text('Selected Chairs'),
                      content: Text(
                        'You selected $_selectedChairs chair(s).',
                        style: TextStyle(fontSize: 18),
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
                  style: TextStyle(fontSize: 15, color: Colors.white), // Added color here
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                // Removed primary here
              ),
            ),
          ],
        ),
      ),
    );
  }
}