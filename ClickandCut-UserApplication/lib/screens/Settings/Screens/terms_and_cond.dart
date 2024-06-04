import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Terms and Conditions",
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
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            _termsAndConditionsText,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

const String _termsAndConditionsText = '''
Terms and Conditions

Welcome to our Terms and Conditions ("Terms")!

These terms and conditions ("Terms", "Agreement") are an agreement between Mobile App Developer ("Mobile App Developer", "us", "we" or "our") and you ("User", "you" or "your"). This Agreement sets forth the general terms and conditions of your use of the mobile application and any of its products or services (collectively, "Mobile Application" or "Services").

...

1. Accounts
2. User content
3. Backups
4. Links to other mobile applications
5. Limitation of liability
6. Changes and amendments
7. Acceptance of these terms
8. Contacting us

These Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of Country.

...

If you have any questions about this Agreement, please contact us.

This document was last updated on January 1, 2024.
''';
