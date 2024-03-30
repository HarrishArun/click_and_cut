import 'package:flutter/material.dart';

class RulesAndResPonsibilitiesHeader extends StatelessWidget {
  const RulesAndResPonsibilitiesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
          child: Text(
            "Rules and Responsibilities",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(height: 1, color: Colors.grey),
        ),
      ],
    );
  }
}
