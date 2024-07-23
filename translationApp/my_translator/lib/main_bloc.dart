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
        width:MediaQuery.of(context).size.width/3,
        height: 145,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:< Widget>[
            SizedBox(height: 10,),
            Text(widget.text ,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            Card(margin: EdgeInsetsDirectional.fromSTEB(340, 70, 0, 0), color: Color.fromARGB(255, 22, 22, 22), child: IconButton(iconSize: 10, alignment: Alignment.bottomRight, onPressed: (){}, icon: Icon(Icons.copy, color: Colors.white,)),),
          ],
        ),
      ),
    );
 }
}