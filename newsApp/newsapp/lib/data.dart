import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data extends StatefulWidget {
  
  const Data({super.key});

  

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {

  Map<dynamic, dynamic> bruteData = {};

  Map<String, String> articles = {};

  void requestData()  async{
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https('newsapi.org', '/v2/top-headlines', {'q':'google', 'apiKey':'d7f01d66b43045df839dca64622b84ea'}, ),
      );
      //var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      setState(() {
        bruteData = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      });
      //var uri = Uri.parse(decodedResponse['uri']);
      print(response.statusCode);

      print(bruteData['totalResults']);

    } catch (e) {
      print(e);
    }
    finally {
      client.close();
    }
  }


  void extractor(){

  }
  @override
  Widget build(BuildContext context) {
    requestData();
    return const Text('Hello');
  }
}


