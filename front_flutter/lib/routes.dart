import 'package:flutter/material.dart';
import 'src/pages/exibe_cavalos.dart';
import 'src/pages/cadastra_cavalo.dart';
import 'src/pages/cadastra_proprietario.dart';
import 'src/pages/exibe_proprietarios.dart';
import 'src/pages/exibe_cavalo.dart';
import 'src/pages/exibe_proprietario.dart';

class AppRoutes {
  static const String exibeCavalos = '/cavalos';
  static const String exibeProprietarios = '/proprietarios';
  static const String cadastraCavalo = '/cadastra-cavalo';
  static const String cadastraProprietario = '/cadastra-proprietario';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      exibeCavalos: (context) => ExibeCavalos(),
      exibeProprietarios: (context) => ExibeProprietarios(),
      cadastraCavalo: (context) => Scaffold(body: CadastraCavalo()),
      cadastraProprietario: (context) => Scaffold(body: CadastraProprietario()),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var uri = Uri.parse(settings.name ?? '');

    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'cavalo') {
      var idCavalo = uri.pathSegments[1];
      return MaterialPageRoute(
        builder: (context) => ExibeCavalo(idCavalo: idCavalo),
      );
    }

   if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'proprietario') {
      var idProprietario = uri.pathSegments[1];
      return MaterialPageRoute(
        builder: (context) => ExibeProprietario(idProprietario: idProprietario),
      );
    } 

    return null;
  }
}
