import 'dart:convert';

import 'package:client/Screen/addtask.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List items =[];
  @override
  void initState() {
    // TODO: implement initState

    featchTodo();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          final item =items[index] as Map;
return ListTile(
  title: Text(item['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  subtitle: Text(item['description']),

);
      }),
appBar: AppBar(
  title: const Text("Todo List"),
),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.pushNamed(context, '/AddTodo');
        },
      label: const  Text("Add Task")),
    );
  }
Future <void> featchTodo()async{
final url ="https://api.nstack.in/v1/todos?page=1&limit=10";

final uri =Uri.parse(url);
final response =await http.get(uri);
final body =response.body;
final json=jsonDecode(body)as Map;
final result=json['items'] as List;
if (response.statusCode==200) {
  setState(() {
    items=result;
  });
  print(body);
}
}


}