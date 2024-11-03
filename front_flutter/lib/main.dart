import 'package:flutter/material.dart';
import 'package:front_flutter/src/blocs/provider.dart';
import 'routes.dart';
import 'src/themes/main_theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null);
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
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
