import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future fetch() async {
    var uri = 'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?name=%EB%8C%80%EC%A7%80%EC%95%BD%EA%B5%AD';

    var response = await http.get(Uri.parse(uri));
    log('Response statusCode ${response.statusCode}');
    log('Response body ${response.body}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            fetch();
          }, child: Text('Click!!'),
          
        ),
      ),
    );
  }
}
