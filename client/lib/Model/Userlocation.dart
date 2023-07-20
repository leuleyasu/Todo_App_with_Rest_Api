import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Location {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Locationcordinate lcncordinate;
 final LocationTimeZonecordinate tizonecdt;
 final Street street;
  Location({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.lcncordinate,
    required this.tizonecdt,
    required this.street,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'lcncordinate': lcncordinate.toMap(),
      'tizonecdt': tizonecdt.toMap(),
      'street': street.toMap(),
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      postcode: int.parse(map['postcode'] ) as String,
      lcncordinate: Locationcordinate.fromMap(map['coordinates'] as Map<String,dynamic>),
      tizonecdt: LocationTimeZonecordinate.fromMap(map['timezone'] as Map<String,dynamic>),
      street: Street.fromMap(map['street'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);
}
class Locationcordinate {

final String latitude;
final String longtiude;
  Locationcordinate({
    required this.latitude,
    required this.longtiude,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longtiude': longtiude,
    };
  }

  factory Locationcordinate.fromMap(Map<String, dynamic> map) {
    return Locationcordinate(
      latitude: map['latitude'] as String,
      longtiude: map['longtiude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Locationcordinate.fromJson(String source) => Locationcordinate.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LocationTimeZonecordinate {
final String offset;
final String description;
  LocationTimeZonecordinate({
    required this.offset,
    required this.description,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'description': description,
    };
  }

  factory LocationTimeZonecordinate.fromMap(Map<String, dynamic> map) {
    return LocationTimeZonecordinate(
      offset: map['offset'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationTimeZonecordinate.fromJson(String source) => LocationTimeZonecordinate.fromMap(json.decode(source) as Map<String, dynamic>);
}
class Street {
  final String number;
  final String name;
  Street({
    required this.number,
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'name': name,
    };
  }

  factory Street.fromMap(Map<String, dynamic> map) {
    return Street(
      number: map['number'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Street.fromJson(String source) => Street.fromMap(json.decode(source) as Map<String, dynamic>);
}
