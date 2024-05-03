import 'package:flutter/material.dart';

import '../../../const.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              color: Color(klightpurple),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0), // Set border radius
              borderSide: BorderSide(color: Color(klightpurple)),
            )),
        onChanged: (value) {
          print('Search query: $value');
        },
      ),
    );
  }
}
