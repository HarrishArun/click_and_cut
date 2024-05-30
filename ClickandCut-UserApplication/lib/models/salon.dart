import 'package:flutter/material.dart';

class Salon {
  final List<String> image;
  final String name;
  final String area;
  final String offerPercentage;
  final String amount;
  final String rating;
  final String time;

  Salon({
    required this.image,
    required this.name,
    required this.area,
    required this.offerPercentage,
    required this.amount,
    required this.rating,
    required this.time,
  });
}
