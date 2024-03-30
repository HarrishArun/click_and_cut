import 'package:flutter/material.dart';

class TutorResBullets extends StatelessWidget {
  const TutorResBullets({super.key, required String Str}) : _str = Str;
  final String _str;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            child: Text(
              _str,
              textAlign: TextAlign.justify,
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
