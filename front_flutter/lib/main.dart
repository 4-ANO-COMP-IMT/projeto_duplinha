import 'package:flutter/material.dart';
import 'package:front_flutter/src/blocs/provider.dart';
import 'src/pages/exibe_cavalos.dart';
import 'src/pages/exibe_proprietarios.dart';
import 'src/pages/cadastra_cavalo.dart'; 
import 'src/pages/cadastra_proprietario.dart'; 
import 'src/components/cartao.dart';
import 'routes.dart';
import 'src/themes/main_theme.dart';
import 'src/blocs/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Haras',
        theme: MainTheme.theme,
        initialRoute: AppRoutes.exibeCavalos,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
