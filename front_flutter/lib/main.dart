import 'package:flutter/material.dart';
import 'package:front_flutter/src/blocs/provider.dart';
import 'routes.dart';
import 'src/themes/main_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Haras',
        //theme: MainTheme.theme,
        initialRoute: AppRoutes.exibeCavalos,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
