import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "https://assets2.cbsnewsstatic.com/hub/i/r/2024/07/29/5435082c-04b3-49bc-b2cd-e5c5463cd9fb/thumbnail/1200x630/28bde7b2f16fc95d1a963a7f1f4826c2/gettyimages-1676292735.jpg?v=8f1da8ceea4c14a7119ef5d6a2829966";

  String title = "";

  String url = "";//url to article

  @override
  Widget build(BuildContext context) {
    
    return  Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width/6,
      height: MediaQuery.of(context).size.height/3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget> [
          
          Text(title, textAlign: TextAlign.center,style: const TextStyle(color: Colors.grey, fontSize:10), maxLines: 3,),
          
          Expanded(
            child: Image.network(
              urlImage,
              scale: 1,
              frameBuilder: (BuildContext context, Widget child,
                int? frame, bool wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
                final totalBytes = loadingProgress?.expectedTotalBytes;
                final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
                if (totalBytes != null && bytesLoaded != null) {
                  return CircularProgressIndicator(
                    backgroundColor: Colors.white70,
                    value: bytesLoaded / totalBytes,
                    color: Colors.blue[900],
                    strokeWidth: 5.0,
                  );
                } else {
                  return child;
                }
              },
            ),
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

