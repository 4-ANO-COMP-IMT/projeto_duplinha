import 'package:flutter/material.dart';

class App extends StatefulWidget{
  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int numeroImagens = 0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minhas imagens'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => numeroImagens++);
          },
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(44, 62, 80, 100),
          shape: CircleBorder(),
          child: const Icon(Icons.dehaze_rounded),),
          body: Text ('$numeroImagens'), //Parâmetro entregue ao construtor Scaffold
      ),
    );
  }
}

