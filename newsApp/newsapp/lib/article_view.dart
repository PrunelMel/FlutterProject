import 'package:flutter/material.dart';

class DefaultImg extends StatelessWidget {

  const DefaultImg({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.newspaper, color: Colors.white,),
      onPressed: () {},
    );
  }
}

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "https://t3n.de/news/wp-content/uploads/2024/07/Eiffelturm-alternativ-1.jpg";

  String title = "Virtuelle Zeitreise durch Paris: Google Maps zeigt Sehenswürdigkeiten in historischer AR-Optik";

  String url = "";

  String publishedAt = "2021-01-01T00:00:00Z";


  @override
  Widget build(BuildContext context) {
    
    

    return Container(

      width: 250,
      height: 350,

      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 32, 32),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),

      child: Stack(

        alignment:Alignment.center,
        children: <Widget>[

          Positioned(
            width: 200,
            top:15,
            child: Text(
              title.length > 80 ? "${title.substring(0, 80)} ... ": title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize:20.0),
              maxLines: 3,
            ),
          ),

          Positioned(
            top: 120,
            child: Text(
              publishedAt,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            
            top: 150,
            bottom: 40,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  urlImage,
                  scale: 1,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
    