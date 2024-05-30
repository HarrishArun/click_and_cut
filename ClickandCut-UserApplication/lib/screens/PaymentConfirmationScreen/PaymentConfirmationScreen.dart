import 'package:flutter/material.dart';

import '../CuponScreen/cupon_screen.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  double courtPrice = 640.0;
  double convenienceFee = 7.55;
  double fitnessCover = 9.0;
  double totalAmount = 656.55;
  double discount = 0.0;

  void applyCoupon(String code) {
    setState(() {
      if (code == 'PLAYON') {
        discount = courtPrice * 0.15;
        if (discount > 150) discount = 150;
      } else if (code == 'FITFORFUN') {
        discount = courtPrice * 0.15;
        if (discount > 480) discount = 480;
      } else if (code == 'PLAYMORE') {
        discount = courtPrice * 0.20;
        if (discount > 960) discount = 960;
      } else {
        discount = 0.0;
      }
      totalAmount = courtPrice + convenienceFee + fitnessCover - discount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruckus Herkley'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookingDetails(),
            Divider(),
            applyCouponButton(context),
            SizedBox(height: 10),
            totalAmountSection(),
            SizedBox(height: 10),
            proceedToPayButton()
          ],
        ),
      ),
    );
  }

  Widget bookingDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BADMINTON',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Standard Wooden A/C Court 1', style: TextStyle(fontSize: 16)),
        Text('Fri, 31st May', style: TextStyle(fontSize: 16)),
        Text('01:00 AM to 02:00 AM', style: TextStyle(fontSize: 16)),
        Text('INR $courtPrice', style: TextStyle(fontSize: 16)),
        Text('Fitness Cover', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget applyCouponButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouponScreen(applyCoupon: applyCoupon),
          ),
        );
        if (result != null) {
          applyCoupon(result);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text('Apply Coupon',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }

  Widget totalAmountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('INR ${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Advance payable', style: TextStyle(fontSize: 16)),
            Text('INR ${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }

  Widget proceedToPayButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text('Proceed to Pay',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
