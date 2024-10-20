import 'package:flutter/material.dart';
import 'src/pages/exibe_cavalos.dart';
import 'src/pages/exibe_proprietarios.dart';
import 'src/pages/cadastra_cavalo.dart';
import 'src/pages/cadastra_proprietario.dart';

class AppRoutes {
  static const String exibeCavalos = '/';
  static const String exibeProprietarios = '/proprietarios';
  static const String cadastraCavalo = '/cadastra-cavalo';
  static const String cadastraProprietario = '/cadastra-proprietario';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      exibeCavalos: (context) => ExibeCavalos(),
      //exibeProprietarios: (context) => ExibeProprietarios(),
      //cadastraCavalo: (context) => CadastraCavalo(),
      //cadastraProprietario: (context) => CadastraProprietario(),
    };
  }
}
