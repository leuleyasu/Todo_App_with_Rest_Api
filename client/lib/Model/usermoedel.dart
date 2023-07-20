// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:client/Model/dob.dart';

import 'Userlocation.dart';
import 'username.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName username;
  final DobUser Dob;
  final Location location;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.username,
    required this.Dob,
    required this.location,
  });

String get fullName{

  return '${username.first} ${username.last}';
}



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'email': email,
      'phone': phone,
      'cell': cell,
      'nat': nat,
      'username': username.toMap(),
      'Dob': Dob.toMap(),
      'location': location.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cell: map['cell'] as String,
      nat: map['nat'] as String,
      username: UserName.fromMap(map['name'] as Map<String,dynamic>),
      Dob: DobUser.fromMap(map['dob'] as Map<String,dynamic>),
      location: Location.fromMap(map['location'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
