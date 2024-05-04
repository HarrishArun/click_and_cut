import 'package:flutter/material.dart';

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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to the map screen to fetch shop location
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  ).then((location) {
                    // Update shop location when returned from the map screen
                    setState(() {
                      shopLocation = location;
                    });
                  });
                },
                icon: Icon(shopLocation == null ? Icons.location_on : Icons.check_circle),
                label: Text(shopLocation == null ? 'Fetch Shop Location' : 'Location Received'),
              ),
              SizedBox(height: 20),
              if (shopLocation != null) ...[
                Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shop Location',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        shopLocation!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Shop Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  // Store the manually entered street address
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
                  // Store the manually entered city
                  city = value;
                },
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  // Store the manually entered state
                  state = value;
                },
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  // Store the manually entered postal code
                  postalCode = value;
                },
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            ],
          ),
        ),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map,
              size: 150,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Map Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none, // Remove underline
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate returning the shop location (latitude and longitude)
                Navigator.pop(context, 'Iyyapanthangal');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Confirm Location',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
