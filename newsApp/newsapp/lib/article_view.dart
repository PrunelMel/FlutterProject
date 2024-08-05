import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  String urlImage = "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";

  String title = "Some Title";

  String url = "";//url to article

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
            top:15,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize:20.0),
              maxLines: 3,
            ),
          ),

          Positioned(
            top: 80,
            child: Text(
              publishedAt,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                urlImage,
                scale: 1,
              ),
            )
          )
        ],
      ),
    );
  }
}
    