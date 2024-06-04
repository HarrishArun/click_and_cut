import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  final Function(String) applyCoupon;

  CouponScreen({required this.applyCoupon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupons'),
      ),
      body: ListView(
        children: [
          couponItem('PLAYON', 'Get 15% off up to INR 150', context),
          couponItem('FITFORFUN', 'Get 15% off up to INR 480', context),
          couponItem('PLAYMORE', 'Get 20% off up to INR 960', context),
          couponItem('PLAYOSAVE', 'Get 10% off up to INR 300', context),
        ],
      ),
    );
  }

  Widget couponItem(String code, String description, BuildContext context) {
    return ListTile(
      title: Text(code),
      subtitle: Text(description),
      trailing: ElevatedButton(
        onPressed: () {
          applyCoupon(code);
          Navigator.pop(context, code);
        },
        child: Text('Apply'),
      ),
    );
  }
}
