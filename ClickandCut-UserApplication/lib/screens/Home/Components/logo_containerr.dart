import 'package:flutter/material.dart';

class logo_containerr extends StatelessWidget {
  const logo_containerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Image.asset("lib/assets/logo_bg.png"),
      ),
    );
  }
}
