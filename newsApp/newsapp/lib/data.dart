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

  Map<dynamic, dynamic> articles = {};

  void requestData()  async{
    
    var client = http.Client();
    
    try {
      
      var response = await client.get(
        Uri.https('newsapi.org', '/v2/top-headlines', {'q':'google', 'apiKey':'d7f01d66b43045df839dca64622b84ea'}, ),
      );
      
      setState(() {

        bruteData = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        
      });
      
      print(response.statusCode);

      extractor();

      print(articles);

    } catch (e) {
      
      print(e);

    }
    finally {
      
      client.close();
    
    }
  }
  

  void extractor(){
    for(int i = 0; i < bruteData['articles'].length; i++){
      setState(() {
        articles[i] = bruteData['articles'][i];

      });
    }

    /*setState(() {
      //articles = bruteData['articles'] as Map<dynamic, dynamic>;
      print(articles);
    });*/
    print(bruteData['articles'].runtimeType);

  }


  Map<dynamic, dynamic> getArticles() {
    return articles;
  }
  
  @override
  Widget build(BuildContext context) {
    requestData();
    return const Text('');
  }
}


