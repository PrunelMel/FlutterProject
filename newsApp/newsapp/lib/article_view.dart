import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "https://assets2.cbsnewsstatic.com/hub/i/r/2024/07/29/5435082c-04b3-49bc-b2cd-e5c5463cd9fb/thumbnail/1200x630/28bde7b2f16fc95d1a963a7f1f4826c2/gettyimages-1676292735.jpg?v=8f1da8ceea4c14a7119ef5d6a2829966";

  String title = "Some Title";

  String url = "";//url to article

  String publishedAt = "2024-08-08T10:00:00Z";

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: const EdgeInsets.all(5.0,),
      width: MediaQuery.of(context).size.width/5.5,
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: List<BoxShadow>.from([
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ])
        
      ),
      child: Column(
        children: <Widget> [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize:20.0),
              maxLines: 3,
            ),
          ),
          
          
            
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
            child: Column(
              children: [
                Text(
                  publishedAt,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    
                    urlImage,
                    scale: 1,
                      
                  ),
                ),
              ],
            ),
          ),
        
        ]
      ),
    );
  }
}

