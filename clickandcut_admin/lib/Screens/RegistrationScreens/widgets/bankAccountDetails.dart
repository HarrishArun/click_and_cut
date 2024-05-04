import 'package:flutter/material.dart';

class BankAccountDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Bank Account Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            BankDetailField(label: 'Account Number'),
            SizedBox(height: 10),
            BankDetailField(label: 'Name on the Account'),
            SizedBox(height: 10),
            BankDetailField(label: 'IFSC Code'),
            SizedBox(height: 10),
            BankDetailField(label: 'Bank Name'),
            SizedBox(height: 10),
            BankDetailField(label: 'Branch Name'),
          ],
        ),
      );
   
  }
}

class BankDetailField extends StatelessWidget {
  final String label;

  const BankDetailField({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter $label',
          ),
        ),
      ],
    );
  }
}