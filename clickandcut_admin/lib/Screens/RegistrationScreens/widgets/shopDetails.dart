import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  String shopName = '';
  String email = '';
  String phoneNumber = '';
  String secondaryPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    shopName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name of the Shop',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.store),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    secondaryPhoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Secondary Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.phone_paused_rounded),
                ),
                keyboardType: TextInputType.phone,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
