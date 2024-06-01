import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orcontainer extends StatelessWidget {
  const orcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2.5,
          width: 70,
          color: Colors.black87.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 15,
            //width: 30,
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black87.withOpacity(0.5),
              ),
            ),
          ),
        ),
        Container(
          height: 2.5,
          width: 70,
          color: Colors.black87.withOpacity(0.5),
        )
      ],
    );
  }
}
