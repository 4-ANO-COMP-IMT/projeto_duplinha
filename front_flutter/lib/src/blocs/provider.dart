import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key? key, required Widget child}): super(key: key, child: child);

  final bloc = Bloc();

  @override //Avisa o compilador q estamos sobrescrevendo e pede ao compilador que está realemnte sendo sobrescrito e não está ocorrendo sobrecarga
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Bloc of (BuildContext context) {
    //O operador ! garante que a expressão que o antecede
    //context.dependOnInheritedWidgetOfExactType<Provider>() neste caso,
    //é diferente de null e podemos acessar a propriedade bloc sem casting,
    //pois a classe é genérica (informamos tipo Provider)
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }

  static void dispose(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<Provider>();
    provider?.bloc.dispose();
  }
}