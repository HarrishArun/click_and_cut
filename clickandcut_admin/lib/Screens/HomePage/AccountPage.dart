import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Dummy data for shop details
  String shopName = 'My Shop';
  String description = 'This is my shop description.';
  String email = 'myshop@example.com';
  String phoneNumber = '+1 234 567 890';
  String address = '123 Main St, City, Country';
  String location = 'Latitude: 40.7128, Longitude: -74.0060'; // Example location

  // List to store shop images
  List<String> shopImages = [
    'assets/4116151.jpg',
    'assets/4116151.jpg',
    'assets/4116151.jpg',
  ];

  // Editing mode flag
  bool isEditing = false;

  // Image picker instance
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Shop Images
            Container(
              height: 200.0, // Adjust height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shopImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      shopImages[index],
                      width: 160.0, // Adjust width as needed
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),

            // Add Image Button
            ElevatedButton.icon(
              onPressed:() {
                
              },
              icon: Icon(Icons.add),
              label: Text('Add Image'),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.deepPurple,
                
              ),
            ),
            SizedBox(height: 16.0),

            // Shop Details Card
            Card(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 16.0),
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Shop Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  isEditing = !isEditing;
                                });
                              },
                            ),
                          ],
                        ),
                        if (isEditing)
                          IconButton(
                            icon: Icon(Icons.done),
                            onPressed: () {
                              // Save edited details
                              setState(() {
                                isEditing = false;
                              });
                            },
                          ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: shopName,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Shop Name',
                        prefixIcon: Icon(Icons.store),
                      ),
                    ),
                    TextFormField(
                      initialValue: description,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description),
                      ),
                    ),
                    TextFormField(
                      initialValue: email,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      initialValue: phoneNumber,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    TextFormField(
                      initialValue: address,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    TextFormField(
                      initialValue: location,
                      readOnly: !isEditing,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        prefixIcon: Icon(Icons.map),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
