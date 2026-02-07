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
            Align(
              alignment: Alignment(-.9, -.5),
              child: Column(
                children: [
                  SizedBox(height: height * .13,),
                  CircleAvatar(
                    radius: 69,
                    backgroundColor: Color.fromARGB(255, 245, 128, 34),
                    child:
                       CircleAvatar(
                        radius: 64,
                        child: ClipOval(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=1000&auto=format&fit=crop',
                            width: 128,
                            height: 128,
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                  ),
                  SizedBox(height: height * .02,),
                  Text('Persona 1', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: height * .02),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.blue[100],
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15), 
                      child: Text('Description')
                      ),
                  ),
            ],
            )
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: height * .13,),
                  CircleAvatar(
                    radius: 69,
                    backgroundColor: Color.fromARGB(255, 245, 128, 34),
                    child: CircleAvatar(
                    radius: 64,
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1665934955885-769a0ecac39a?q=80&w=3638&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        width: 128,
                        height: 128,
                        fit: BoxFit.cover,
                      )
                    ),
                    ),
                  ),
                  SizedBox(height: height * .02,),
                  Text('Persona 2', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: height * .02),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.blue[100],
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15), 
                      child: Text('Description')
                      ),
                  ),
            ],
            )
            ),
            Align(
              alignment: Alignment(.9, -.5),
              child: Column(
                children: [
                  SizedBox(height: height * .13,),
                  CircleAvatar(
                    radius: 69,
                    backgroundColor: Color.fromARGB(255, 245, 128, 34),
                    child:
                      CircleAvatar(
                      radius: 64,
                      child: ClipOval(
                        child: Image.network(
                          'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg',
                          width: 128,
                          height: 128,
                          fit: BoxFit.cover,
                        )
                      ),
                      ),
                    ),
                  SizedBox(height: height * .02,),
                  Text('Persona 3', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: height * .02),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.blue[100],
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(15), 
                      child: Text('Description')
                      ),
                  ),
            ],
            )
            ),
          ],
        ),
      ),
      );
  }
}