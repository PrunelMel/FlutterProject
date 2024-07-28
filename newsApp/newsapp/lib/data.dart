import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data extends StatefulWidget {
  
  Data({super.key});

  final int statusCode = 0;

  final Map<dynamic, dynamic> parsedData = {}; 

  void requestData()  async{
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https('newsapi.org', '/v2/top-headlines', {'q':'google', 'apiKey':'d7f01d66b43045df839dca64622b84ea'}, ),
      );
      
      //var uri = Uri.parse(decodedResponse['uri']);
      print(response.statusCode);
      print(response.body);

    }
    finally {
      client.close();
    }
  }

  @override
  State<Data> createState() => _DataState();
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
