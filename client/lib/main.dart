
import 'package:client/Screen/HomeScreen.dart';
import 'package:client/Screen/addtask.dart';
import 'package:client/home.dart';
import 'package:flutter/material.dart';

import 'Screen/Todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
  routes: {
    '/':(context)=>Todo(),
    '/Homescreen':(context)=>HomeScreen(),
    '/AddTodo':(context)=>AddTask(),

  },
    );
  }


}
