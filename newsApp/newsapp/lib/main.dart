import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:  Column(
        children: [
          Data(),
        ],
      ),
    );
    
  }
}

class _DataState extends State<Data> {

  Map<dynamic, dynamic> parsedData = {}; 

  void requestData()  async{
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https('newsapi.org', '/v2/top-headlines', {'q':'google', 'apiKey':'d7f01d66b43045df839dca64622b84ea'}, ),
      );
      //var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      setState(() {
        parsedData = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      });
      //var uri = Uri.parse(decodedResponse['uri']);
      print(response.statusCode);
    }
    finally {
      client.close();
    }
  }
  @override
  Widget build(BuildContext context) {
    widget.requestData();
    return const Text('Hello');
  }
}
