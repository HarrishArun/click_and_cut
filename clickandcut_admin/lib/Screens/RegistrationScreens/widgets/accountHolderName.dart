import 'package:flutter/material.dart';

class AccountHolderName extends StatefulWidget {
  @override
  _AccountHolderNameState createState() => _AccountHolderNameState();
}

class _AccountHolderNameState extends State<AccountHolderName> {
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  lastName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.person),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
