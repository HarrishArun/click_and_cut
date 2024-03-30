import 'package:flutter/material.dart';

import 'TutorBullets.dart';

class RulesAndResPonsibilitiesScrollable extends StatelessWidget {
  const RulesAndResPonsibilitiesScrollable({
    super.key,
    required this.tutorResponsibilities,
  });

  final List<String> tutorResponsibilities;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0),
      child: ListView(children: [
        Text(
          "A Tutor is responsible for helping students with individualized assistance. They study lesson plans and review textbooks to prepare for a tutoring session, which includes preparing additional projects as well answering questions about the material being covered in class or on an assignment if needed.",
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tutorResponsibilities.map((str) {
            return TutorResBullets(
              Str: str,
            );
          }).toList(),
        )
      ]),
    );
  }
}
