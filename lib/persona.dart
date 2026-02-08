import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<dynamic>> fetchNames() async {
    final url = Uri.parse('http://127.0.0.1:5000/');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: fetchNames(),
          builder: (context, snapshot) {
            String name1 = "";
            String name2 = "";
            String name3 = "";
            String description1 = "";
            String description2 = "";
            String description3 = "";

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final decoded = snapshot.data!;
              name1 = decoded[0]["name"];
              name2 = decoded[1]["name"];
              name3 = decoded[2]["name"];
              description1 = decoded[0]["description"];
              description2 = decoded[1]["description"];
              description3 = decoded[2]["description"];
            }

            return Stack(
              children: [
                Align(
                  alignment: const Alignment(-.9, -.5),
                  child: Column(
                    children: [
                      SizedBox(height: height * .13),
                      CircleAvatar(
                        radius: 69,
                        backgroundColor: const Color.fromARGB(255, 245, 128, 34),
                        child: CircleAvatar(
                          radius: 64,
                          child: ClipOval(
                            child: Image.network(
                              'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=1000&auto=format&fit=crop',
                              width: 128,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .02),
                      Text(name1, style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: height * .02),
                      Container(
                        height: 300,
                        width: 200,
                        color: Colors.blue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(description1),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: height * .13),
                      CircleAvatar(
                        radius: 69,
                        backgroundColor: const Color.fromARGB(255, 245, 128, 34),
                        child: CircleAvatar(
                          radius: 64,
                          child: ClipOval(
                            child: Image.network(
                              'https://images.unsplash.com/photo-1665934955885-769a0ecac39a?q=80&w=3638&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              width: 128,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .02),
                      Text(name2, style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: height * .02),
                      Container(
                        height: 300,
                        width: 200,
                        color: Colors.blue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(description2),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(.9, -.5),
                  child: Column(
                    children: [
                      SizedBox(height: height * .13),
                      CircleAvatar(
                        radius: 69,
                        backgroundColor: const Color.fromARGB(255, 245, 128, 34),
                        child: CircleAvatar(
                          radius: 64,
                          child: ClipOval(
                            child: Image.network(
                              'https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg',
                              width: 128,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * .02),
                      Text(name3, style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                      SizedBox(height: height * .02),
                      Container(
                        height: 300,
                        width: 200,
                        color: Colors.blue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(description3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}