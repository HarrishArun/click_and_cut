import 'package:flutter/material.dart';

class ShopType extends StatefulWidget {
  @override
  _ShopTypeState createState() => _ShopTypeState();
}

class _ShopTypeState extends State<ShopType> {
  String? selectedShopType;

  final List<String> shopTypes = ['Salon', 'Beauty Parlour', 'Both'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shop Type',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Image.asset(
            'assets/8292829.jpg', // Path to your custom illustration asset
            height: 250, // Adjust height as needed
          ),
          SizedBox(height: 10.0),
          Column(
            children: shopTypes
                .map(
                  (type) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedShopType == type ? Colors.deepPurple : Colors.grey[200],
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedShopType = type;
                          });
                        },
                        child: Center(
                          child: Text(
                            type,
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedShopType == type ? Colors.white : Colors.black,
                              fontWeight: selectedShopType == type ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
