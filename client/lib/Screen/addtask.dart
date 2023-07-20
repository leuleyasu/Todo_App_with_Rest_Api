import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleformcontroller=TextEditingController();
  TextEditingController descrformcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo Task"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black12,
body: ListView(
  children: [
      TextFormField(
        controller: titleformcontroller,
    decoration: const InputDecoration(
      label: Text("Title")

    ),

    ),
 const   SizedBox(height: 20,),
   TextFormField(
    controller: descrformcontroller,
    decoration: const InputDecoration(  fillColor: Colors.green,
      label: Text("Description"),
      labelStyle: TextStyle(color: Colors.white)

    ),
    minLines: 5,
    maxLines: 8,
    ),
    SizedBox(height: 10,),
    ElevatedButton(

      style: ElevatedButton.styleFrom(
primary: Colors.blueAccent
      ),
      onPressed: submitdata,
       child: const Text("Submit",style: TextStyle(color: Colors.white),))
  ],
),

    );



  }
   Future<void> submitdata() async{
final title=titleformcontroller.text;
final description=descrformcontroller.text;
 final body ={
  "title":title,
  "description":description,
  "is_completed": false,
 };
 const url ="http://api.nstack.in/v1/todos";
 final uri=Uri.parse(url);
 final response =  await http.post(uri,body: jsonEncode(body),
 headers: {'content-Type':'application/json'},
 );

if (response.statusCode==201) {
  titleformcontroller.text='';
  descrformcontroller.text='';

  showsnacknar('sucessefull creation');

}else{
  showsnacknar('Error in creation');

}

//  final body= response.body;
print(response);

  }
  void showsnacknar(String message){
  final snackbar=SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);

}
}