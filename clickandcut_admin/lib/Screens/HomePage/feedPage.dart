import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  // Example list of local asset image paths
  final List<String> imagePaths = [
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    'assets/4957136.jpg',
    // Add more image paths as needed
  ];

  FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Section 1: Shop pic and name with add button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.purple, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/4116151.jpg'), // Replace with your image URL or AssetImage
                      ),
                    ),
                    SizedBox(width: 25.0), // Add some space between the image and the text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cheap&Best', // Replace with your shop name
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple, // Customize text color
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Your go-to shop for everything!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section 2: Post count, total saved, total likes
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('Post count', '193', Icons.post_add),
                _buildStatColumn('Saved', '200', Icons.bookmark),
                _buildStatColumn('Total Likes', '4000', Icons.cut_sharp), // Custom icon if needed
              ],
            ),
          ),

          // Section 3: Display all pictures posted
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              shrinkWrap: true, // Important to wrap the GridView within a ListView
              physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: imagePaths.length, // Use the length of the image list
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle upload new picture action
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple, // Customize button color
      ),
    );
  }

  Widget _buildStatColumn(String label, String count, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.purple),
            SizedBox(width: 4.0),
            Text(
              count,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
