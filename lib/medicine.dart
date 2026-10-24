import 'package:flutter/material.dart';

class Medicine {
  String name;
  String time;
  Color color;
  String category;
  bool taken;

  Medicine({
    required this.name,
    required this.time,
    required this.color,
    required this.category,
    this.taken = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time,
      'color': color.toARGB32(),
      'category': category,
      'taken': taken,
    };
  }

  factory Medicine.fromJson(
    Map<String, dynamic> json,
  ) {
    return Medicine(
      name: json['name'],
      time: json['time'],
      color: Color(json['color']),
      category: json['category'],
      taken: json['taken'] ?? false,
    );
  }
}