import 'package:flutter/material.dart';

class DefaultImg extends StatelessWidget {

  const DefaultImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        
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
    
    return  FractionallySizedBox(
      widthFactor: 0.2,
      //heightFactor: 0.8,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 300.0
        ),
        height: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 32, 32),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 1.0, color: Colors.white),
        ),
        child: Stack(

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
            
            
              
            FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 32, 32, 32),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),

                ),
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
            ),
          
          ]
        ),
      ),
    );
  }
}
