import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_translator/main_bloc.dart';
import 'package:my_translator/main_dropdown_menu.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Translator',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Translator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Field();
  }
}




class Field extends StatefulWidget{

  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  
  String textToTranslate = '';
  
  String mainLang = "fr";

  String distLang = "en";

  String outText = "";
  
  final TextEditingController controller = TextEditingController();

  void translatedText (String txt, String from, String to) async{

    
    GoogleTranslator translator =  GoogleTranslator();

    await translator.translate(txt, from: from, to: to)
    .then((value){
      setState(() {
        outText = value.text;
      });
      //print(value);
    })
    .catchError((err){
      setState(() {
        //outText = err.toString();
        print(err);
      });
    });
  }

  
  String? getText(){
    return textToTranslate;
  }
  @override
  Widget build(BuildContext context){

    if (controller.text.isEmpty){
      setState(() {
        outText
         = "";
      });
    }

    Widget dropdown1 = DropdownMenu<MainLangLabel>(
    initialSelection: MainLangLabel.french,
    textStyle: const TextStyle(color: Colors.white),
    requestFocusOnTap: true,
    label:const Text(""),
    onSelected: (MainLangLabel? lang){
      setState(() {
      mainLang = lang!.code;
      });
      
    },
    dropdownMenuEntries: MainLangLabel.values.map<DropdownMenuEntry<MainLangLabel>>(
      (MainLangLabel lang){
        return DropdownMenuEntry<MainLangLabel>(
          value: lang,
          label: lang.name,
          enabled: true,
          
        );
      }).toList(),
    
    );

    Widget dropdown2 = DropdownMenu<MainLangLabel>(
      initialSelection: MainLangLabel.english,
      textStyle: const TextStyle(color: Colors.white),
      requestFocusOnTap: true,
      label:const Text(""),
      onSelected: (MainLangLabel? lang){
        setState(() {
        distLang = lang!.code;
        });
        
      },
      dropdownMenuEntries: MainLangLabel.values.map<DropdownMenuEntry<MainLangLabel>>(
        (MainLangLabel lang){
          return DropdownMenuEntry<MainLangLabel>(
            value: lang,
            label: lang.name,
            enabled: true,
            
          );
        }
      ).toList(),
    
    );
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        title: Text('', style: const TextStyle(color: Colors.white, ),),
        centerTitle: true
      ),
      body: Scaffold(
        body:Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("TRANSLATOR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:35, letterSpacing:6),),
              SizedBox(height: 50,),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                  dropdown1,
                  SizedBox(width: 100,),
                  Icon(Icons.arrow_right_alt_outlined, color: Colors.white),
                  SizedBox(width: 100,),
                  dropdown2,
                ],
              ),
              SizedBox(width:50, height:50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 450,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                      label: Text(''),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(borderSide: BorderSide(width:1.0, color:  Colors.white, style: BorderStyle.solid)),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      filled: true,
                      fillColor: Color.fromARGB(255, 22, 22, 22),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) => {setState(() {
                        textToTranslate = value;
                        print(value);
                        translatedText(textToTranslate, mainLang, distLang);
                      })
                      
                      },
                      maxLength: 100,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      maxLines: 5,
                      
                    ),
                  ),
                  MainBloc(text: outText)

                ],
              ),
              ],
          ),
        ),
        backgroundColor:  Color.fromARGB(255, 22, 22, 22),
      ),
      
    );
  }
}
