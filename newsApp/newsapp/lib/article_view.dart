import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class DefaultImg extends StatelessWidget {

  const DefaultImg({super.key});

  @override
  Widget build(BuildContext context) {
    /*return IconButton(
      icon: const Icon(Icons.newspaper, color: Colors.white,),
      onPressed: () {},
    );*/

    return Container(

      width: 300,
      height: 250,

      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 190, 66, 66),
      ),
      
      alignment: Alignment.topLeft,
      child: Container(
        width: 150,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
      ),
    );
  }
}

class ArticleView extends StatefulWidget {
  
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  String urlImage = "https://smartcdn.gprod.postmedia.digital/financialpost/wp-content/uploads/2024/08/no0809fb-google.jpg";

  String title = "Openstreetmap: Was ihr über die freie Alternative zu Google Maps wissen müsst, description: Google Maps ist und bleibt der Standard in Sachen Navigationslösungen";

  String url = "https://t3n.de/news/openstreetmap-google-maps-alternative-1639159/";

  String publishedAt = "2021-01-01T00:00:00Z";

  Color borderColor = const Color.fromARGB(255, 32, 32, 32);

  Future<void> urlLauncher(Uri url) async {
    /*if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }*/

    await launchUrl(url).then((value) => Navigator.of(context).pop())
    .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    
    Uri finalUrl = Uri.parse(url);

    return MouseRegion(
      onHover: (event) {
        setState(() {
          borderColor = const Color.fromARGB(255, 68, 68, 68);
        });
      },
      onExit:(event) {
        setState(() {
          borderColor = const Color.fromARGB(255, 32, 32, 32);
        });
      },
      child: Container(
      
        width: 250,
        height: 350,
        //Color.fromARGB(255, 68, 68, 68)
        decoration:  BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: borderColor, width: 1.0)),
          color: const Color.fromARGB(255, 32, 32, 32),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        
        
        child: Stack(
      
          alignment:Alignment.center,
          children: <Widget>[
      
            Positioned(
              width: 200,
              top:15,
              child: Text(
                title.length > 30 ? "${title.substring(0, 30)} ... ": title,
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
              
              top: 140,
              bottom: 30,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.network(
                  
                    urlImage,
                    scale: 1,
                  ),
                ),
              )
            ),
      
            Positioned(
              bottom: 0,
              child: Container(
                width: 250,
                alignment: Alignment.bottomRight,
                child: IconButton(
                  tooltip: 'Read',
                  icon: const Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                  onPressed: () {
                    urlLauncher(finalUrl);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
    

