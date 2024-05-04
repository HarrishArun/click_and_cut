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
            'How do you identify your Shop?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 20.0),
          Wrap(
            spacing: 8.0,
            children: shopTypes
                .map((type) => ChoiceChip(
                      label: Text(type),
                      selected: selectedShopType == type,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedShopType = type;
                          } else {
                            selectedShopType = null;
                          }
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
