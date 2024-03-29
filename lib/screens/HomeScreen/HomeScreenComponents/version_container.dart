import 'package:flutter/material.dart';

class version_container extends StatelessWidget {
  const version_container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "V 1.1",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
