import 'package:flutter/material.dart';
import 'package:user_personas/persona.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Persona Generator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 245, 128, 34)),
      ),
      home: const MyHomePage(title: 'User Persona Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String product_description = "";
  final form_key = GlobalKey<FormState>();

  Future<bool> savingDescription() async {
    final isValid = form_key.currentState?.validate() ?? false;

    if (!isValid) {
      print('not validated');
      return false;
    }
    form_key.currentState!.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Colors.amber
        backgroundColor: const Color.fromARGB(255, 245, 128, 34),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 52,
            // fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        // Center takes a single child and positions it in the middle of the parent
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: 
                const Text('Enter a brief description of your product:'
                  , style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 0),
              child: Form(
                key: form_key,
                child: TextFormField(
                  maxLines: null,
                  minLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ex. A leather wallet that lets you store your cards and cash, but also has a built in tracker so you can find it if you lose it.',
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter a description' : null,
                  onSaved: (value) => product_description = value ?? '',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 20),
              child: ElevatedButton(
                onPressed: () async {
                  print('button pressed');
                  final saved = await savingDescription();
                  if (!saved) return;
                  print('description saved: ' + product_description);

                  final url = Uri.parse('http://127.0.0.1:5000/');
                  final desc = jsonEncode({'product_desc': product_description});
                  final response = await http.post(url,
                      body: desc,
                      headers: {'Content-Type': 'application/json'});

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text('generate personas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
