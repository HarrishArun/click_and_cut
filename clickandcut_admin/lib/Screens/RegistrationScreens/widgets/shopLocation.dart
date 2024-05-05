import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatting

class ShopLocation extends StatefulWidget {
  @override
  _ShopLocationState createState() => _ShopLocationState();
}

class _ShopLocationState extends State<ShopLocation> {
  String? shopLocation;
  String? street;
  String? city;
  String? state;
  String? postalCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Shop Location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // SizedBox(height: 10),
              
            ],
          ),
          Container(
            height: 350,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/puri_large.jpg',
                  fit:BoxFit.cover,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                Center(
                  child: Text(
                    'Shop Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    street = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Street',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          state = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'State',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          postalCode = value;
                        },
                        keyboardType: TextInputType.number, // Allow only numbers
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Restrict to digits
                          LengthLimitingTextInputFormatter(5), // Limit postal code length
                        ],
                        decoration: InputDecoration(
                          labelText: 'Postal Code',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
