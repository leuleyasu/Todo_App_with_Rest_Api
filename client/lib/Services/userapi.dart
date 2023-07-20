
import 'dart:convert';
import 'package:http/http.dart'as http;
import '../Model/usermoedel.dart';

class UserApi{
 static Future<List<User>> featchuser() async{


    const url="https://randomuser.me/api/?results=10";
  final uri= Uri.parse(url);
final http.Response response= await http.get(uri);
final body =response.body;
final json=jsonDecode(body);

final List<dynamic> results=json['results'];
final users=results.map((e){
return User.fromMap(e);
}).toList();
return users;



 }

      }
