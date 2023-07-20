import 'package:client/Services/userapi.dart';
import 'package:flutter/material.dart';

import 'Model/usermoedel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <User> users=[];
  @override
  void initState() {
    super.initState();
  featchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
        Container(
          width: 1000,
          height: 680,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder:

          (context,index){
            final  user=users[index];
            final email=user.email;
            // final name =user['name']['first'];
            // final img=user['picture']['thumbnail'];

return ListTile(
  // trailing:  CircleAvatar(
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(180),
  //     child: Image.network(img)),

  // ),
  // leading: CircleAvatar(
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(180),
  //     child: Image.network(img)),

  // ),
  title: Text(email),

  // subtitle: Text(name.toString()),
);

          }),
        ),
        FloatingActionButton(onPressed:
        (){
          featchUsers();
          print("featch user clicked");
        }

        )
        ],
      ),
    );
  }


Future <void> featchUsers() async{

final response=  await UserApi.featchuser();
setState(() {
  users=response;
});
}




  }
