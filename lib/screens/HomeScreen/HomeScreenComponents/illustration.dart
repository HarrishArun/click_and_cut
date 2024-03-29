import 'package:flutter/material.dart';

class illustration extends StatelessWidget {
  const illustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: Image.asset("lib/assets/barberillustration.png"),
      ),
    );
  }
}
