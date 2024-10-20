import 'package:flutter/material.dart';
import 'src/pages/exibe_cavalos.dart';
import 'src/pages/exibe_proprietarios.dart';
import 'src/pages/cadastra_cavalo.dart'; 
import 'src/pages/cadastra_proprietario.dart'; 
import 'src/components/cartao.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cavalos',
      home: ExibeCavalos(),
      routes: AppRoutes.getRoutes(),
    );
  }
}
