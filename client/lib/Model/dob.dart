import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class DobUser {
  final DateTime date;
  final int age;
  DobUser({
    required this.date,
    required this.age,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'age': age,
    };
  }

  factory DobUser.fromMap(Map<String, dynamic> map) {
    return DobUser(
      date: DateTime.parse(map['date'] ),
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DobUser.fromJson(String source) => DobUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
