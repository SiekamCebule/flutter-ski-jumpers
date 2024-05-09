import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ski_jumpers/models/country.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
var formatter = DateFormat('dd-MM-yyyy');

class SkiJumper {
  SkiJumper({
    required this.name,
    required this.surname,
    required this.country,
    required this.birthdate,
    required this.hasIndWCPodium,
    required this.hasIndMedal,
  }) : id = uuid.v4();

  String id;
  String name;
  String surname;
  Country country;

  double? personalBest;
  DateTime birthdate;
  bool hasIndWCPodium;
  bool hasIndMedal;

  String get nameAndSurname {
    return '${surname.toUpperCase()} $name';
  }

  String get formattedBirthdate {
    return formatter.format(birthdate);
  }

  ImageProvider get image {
    return AssetImage(
        'assets/jumpers_images/${name.toLowerCase()}_${surname.toLowerCase()}.png');
  }
}
