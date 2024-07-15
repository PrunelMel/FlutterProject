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

    return SizedBox(
      width:100, 
      child: Column(
        children:< Widget>[Text(widget.text , style: TextStyle(color: Colors.white),)],
      ),
    );
 }
}