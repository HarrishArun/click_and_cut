import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Help and Support",
          style: TextStyle(
            fontSize: 20,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [
                  Color(0xFF6f4fc1),
                  Color(0xFF904088),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(
            title: 'About This App',
            onTap: () {
              // Navigate to About This App page
            },
          ),
          _buildListItem(
            title: 'Rescheduling',
            onTap: () {
              // Navigate to Rescheduling help page
            },
          ),
          _buildListItem(
            title: 'About Coupons',
            onTap: () {
              // Navigate to About Coupons page
            },
          ),
          _buildListItem(
            title: 'Payment Methods',
            onTap: () {
              // Navigate to Payment Methods page
            },
          ),
          _buildListItem(
            title: 'FAQs',
            onTap: () {
              // Navigate to FAQs page
            },
          ),
          _buildListItem(
            title: 'Contact Us',
            onTap: () {
              // Navigate to Contact Us page
            },
          ),
          _buildListItem(
            title: 'Terms of Service',
            onTap: () {
              // Navigate to Terms of Service page
            },
          ),
          _buildListItem(
            title: 'Privacy Policy',
            onTap: () {
              // Navigate to Privacy Policy page
            },
          ),
          _buildListItem(
            title: 'Feedback',
            onTap: () {
              // Navigate to Feedback page
            },
          ),
          _buildListItem(
            title: 'Troubleshooting',
            onTap: () {
              // Navigate to Troubleshooting page
            },
          ),
          SizedBox(
            height: 10,
          )
          // Add more options as needed
        ],
      ),
    );
  }

  Widget _buildListItem({required String title, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
