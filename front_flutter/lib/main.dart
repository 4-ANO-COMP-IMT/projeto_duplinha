import 'package:flutter/material.dart';
import 'src/pages/exibe_cavalos.dart';
import 'src/pages/exibe_proprietarios.dart';
import 'src/pages/cadastra_cavalo.dart'; 
import 'src/pages/cadastra_proprietario.dart'; 
import 'src/components/cartao.dart';
import 'routes.dart';
import 'src/themes/main_theme.dart';

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
      theme: MainTheme.theme,
      home: ExibeCavalos(),
      routes: AppRoutes.getRoutes(),
    );
  }
}
