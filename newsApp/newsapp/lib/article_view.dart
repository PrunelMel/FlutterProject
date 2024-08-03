import 'package:flutter/material.dart';

class DefaultImg extends StatelessWidget {

  const DefaultImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: IconButton(
        icon: const Icon(Icons.newspaper, color: Colors.white,),
        onPressed: () {},
      )
    );
  }
}

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "";

  String title = "";

  String url = "";//url to article

  String publishedAt = "";

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
                  child: urlImage == "" ? const DefaultImg() : Image.network(
                    
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
