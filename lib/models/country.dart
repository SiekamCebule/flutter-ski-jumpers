import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class Country {
  const Country({required this.code, required this.name});
  final String name;
  final String code;

  Flag get flag {
    return Flag.fromString(
      code.toUpperCase(),
      fit: BoxFit.fill,
    );
  }
}
