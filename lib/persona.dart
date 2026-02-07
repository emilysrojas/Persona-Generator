import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  //print(1+1);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //store different info into vars
  String name = "Kelly Tai";
  int age = 20;

  List numbers = [1,2,3];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: height * .13,),
                  CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage('https://picsum.photos/250?image=9')
                  ),
                  SizedBox(height: height * .02,),
                  Text('Name', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: height * .02),
                  Container(
                    height: 300,
                    width: 300,
                    color: const Color.fromARGB(255, 245, 128, 34),
                    child: Text('Description')
                  ),
            ],
            )
            ),
          ],
        ),
      ),
      // debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //     body: Stack(
      //       children: <Widget>[
      //         Align(
      //           alignment: Alignment.center,
      //           child: Container(
      //             child: Container(
      //             height: 300,
      //             width: 300,
      //             color: const Color.fromARGB(255, 245, 128, 34),
      //             child: Text(name),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     ),
      );
  }
}