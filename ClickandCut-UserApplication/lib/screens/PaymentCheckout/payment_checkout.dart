import 'package:click_and_cut/const.dart';
import 'package:click_and_cut/screens/PaymentCheckout/cupon_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double chairPrice = 100.00;
  double convenienceFee = 3.00;
  late double totalAmount;
  double discount = 0.00;
  late double cgst;
  late double sgst;
  late String discountCode = "";
  bool isFullPaymentSelected = false;

  void applyCoupon(String code) {
    setState(() {
      if (code == 'PLAYON') {
        discount = chairPrice * 0.25;
        discountCode = 'PLAYON';
        if (discount > 10) discount = 10;
      } else if (code == 'FITFORFUN') {
        discount = chairPrice * 0.50;
        discountCode = 'FITFORFUN';
        if (discount > 20) discount = 20;
      } else if (code == 'PLAYMORE') {
        discount = chairPrice * 0.20;
        discountCode = 'PLAYMORE';
        if (discount > 15) discount = 15;
      } else {
        discount = 0.0;
      }
      totalAmount = totalAmount - discount;
    });
  }

  void initState() {
    super.initState();
    setState(() {
      cgst = 0.09 * chairPrice;
      sgst = 0.09 * chairPrice;
      totalAmount = chairPrice + cgst + sgst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [DetailsSelected()],
        ),
      ),
    );
  }

  Widget DetailsSelected() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tony & Guy',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              Icon(
                Icons.spa, // Example icon, replace with your preferred icon
                color: Colors.black,
                size: 24, // Customize icon color as needed
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  Icons
                      .location_on, // Example icon, replace with your preferred icon
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Area: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'XYZ Street',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  Icons
                      .access_time, // Example icon, replace with your preferred icon
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Selected Time: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '3:00 PM',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  Icons.chair, // Example icon, replace with your preferred icon
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  'Selected Chair: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Chair A',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:
                    Alignment.topLeft, // Define the start point of the gradient
                end: Alignment
                    .bottomRight, // Define the end point of the gradient
                colors: [
                  Color(klightpurple), // Start color of the gradient
                  Color(kdarkpurple), // End color of the gradient
                ],
              ),
              borderRadius:
                  BorderRadius.circular(10), // Add border radius if needed
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CouponScreen(applyCoupon: applyCoupon),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_offer, // Coupon code icon
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Apply Coupon', // Text "Apply Coupon"
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Amount",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+\$${chairPrice}', // Example: positive amount
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Adjust color as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount ${discountCode}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '-\$${discount}', // Example: negative amount
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Adjust color as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CGST 5%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+\$${cgst}', // Example: positive amount
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Adjust color as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SGST 8%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+\$${sgst}', // Example: negative amount
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Adjust color as needed
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Convinience Fee',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+\$0.00', // Example: negative amount
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Adjust color as needed
                    ),
                  ),
                ],
              ),
              Divider(height: 20, thickness: 2), // Divider line
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalAmount}', // Total amount calculation here
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Adjust color as needed
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 200, // Increased container height
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pay Advance',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16), // Larger font size
                      ),
                      SizedBox(height: 12), // Increased height
                      Text(
                        '\$${(0.20 * totalAmount).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // Larger font size
                          color: Colors.green, // Adjust color as needed
                        ),
                      ),
                      SizedBox(height: 12), // Increased height
                      // Perks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- Early access to events',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '- Exclusive discounts',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(), // Increased height
                      GestureDetector(
                        onTap: () {
                          // Proceed to Pay button action
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment
                                  .topLeft, // Define the start point of the gradient
                              end: Alignment
                                  .bottomRight, // Define the end point of the gradient
                              colors: [
                                Color(
                                    klightpurple), // Start color of the gradient
                                Color(kdarkpurple), // End color of the gradient
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                10), // Add border radius if needed
                          ),
                          child: Text(
                            'Proceed to Pay',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Larger font size
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pay Full',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16), // Larger font size
                      ),
                      SizedBox(height: 12), // Increased height
                      Text(
                        '\$${totalAmount}', // Total amount calculation here
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20, // Larger font size
                          color: Colors.green, // Adjust color as needed
                        ),
                      ),
                      SizedBox(height: 12), // Increased height
                      // Perks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- Free shipping',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '- Loyalty points',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(), // Increased height
                      GestureDetector(
                        onTap: () {
                          // Proceed to Pay button action
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment
                                  .topLeft, // Define the start point of the gradient
                              end: Alignment
                                  .bottomRight, // Define the end point of the gradient
                              colors: [
                                Color(
                                    klightpurple), // Start color of the gradient
                                Color(kdarkpurple), // End color of the gradient
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                10), // Add border radius if needed
                          ),
                          child: Text(
                            'Proceed to Pay',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Larger font size
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
