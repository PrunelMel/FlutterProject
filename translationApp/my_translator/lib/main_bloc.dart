import 'package:flutter/material.dart';

class MainBloc extends StatefulWidget{
   
  MainBloc ({super.key, required this.text});
  
  final String text;

  @override
  State<MainBloc> createState() => _MainBlocState();
}

class _MainBlocState extends State<MainBloc> {
    


  @override
  Widget build (BuildContext context){

    return Card(
      margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 24),
      color: Color.fromARGB(255, 22, 22, 22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(color: Color.fromARGB(255, 68, 68, 68), width: 1.0),

      ),
      child: SizedBox(
        width:450,
        height: 145, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:< Widget>[Text(widget.text , style: TextStyle(color: Colors.white)),],
        ),
      ),
    );
 }
}