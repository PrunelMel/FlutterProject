import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "https://t3n.de/news/wp-content/uploads/2024/06/shutterstock_2443144493.jpg";

  String title = "Du willst KI-Bots von deiner Website fernhalten? Achte auf diese wichtigen Dinge";

  String url = "";//url to article

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width/2,
      height: MediaQuery.of(context).size.height/3,
      child: Column(
        children: <Widget> [
          
          Text(title, style: const TextStyle(color: Colors.grey, fontSize:10),),
          
          Expanded(
            child: Image.network(urlImage, scale: 1,)
          ),
          
          ElevatedButton(
            
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              
            ),
            child: const Text("Read"),
      
          )
        
        ]
      ),
    );
  }
}

