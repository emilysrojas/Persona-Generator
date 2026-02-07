import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String persona ="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persona Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(persona,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () async {
                print("button pressed");
                final url=Uri.parse('http://127.0.0.1:5000/');
                final response = await http.get(url);
                print("response exists");

                
                if (response.statusCode != 200) {
                  print("failed to load persona");
                  throw Exception('Failed to load persona');
                }
                final decoded = jsonDecode(response.body);

                setState((){
                  persona=decoded["name"];
                });
              },
              child: Text('Generate Persona'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
