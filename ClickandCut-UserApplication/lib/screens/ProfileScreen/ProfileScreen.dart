import 'package:click_and_cut/const.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'Screens/ProfileDetailsScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ProfileCard(),
          SizedBox(height: 20.0),
          OptionCard(
            icon: Icons.bookmark,
            title: 'My Bookings',
            ontap: () {},
          ),
          OptionCard(
            icon: Icons.help,
            title: 'Help & Support',
            ontap: () {},
          ),
          OptionCard(
            icon: Icons.question_answer,
            title: 'FAQ',
            ontap: () {},
          ),
          OptionCard(
            icon: Icons.person_add,
            title: 'Invite',
            ontap: () {},
          ),
          OptionCard(
            icon: Icons.policy,
            title: 'Terms and Conditions',
            ontap: () {},
          ),
          OptionCard(
            icon: Icons.logout,
            title: 'Logout',
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
              radius: 40.0,
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileDetailScreen()));
                  },
                  child: Text(
                    'View Full Profile',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  const OptionCard(
      {Key? key, required this.icon, required this.title, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(
            icon,
            color: Color(kdarkpurple),
          ),
          title: Text(title),
          onTap: () => ontap),
    );
  }
}
