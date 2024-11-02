import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //StreamController vem do pacote dart:async
  final _nomeCavaloController = StreamController <String> ();
  final _passwordController = StreamController <String> ();

  Stream<String> get nomeCavalo => _nomeCavaloController.stream.transform(validateTexto);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get emailPasswordAreOkay => CombineLatestStream.combine6(nomeCavalo, password, b, c, d, e, (e, p, b, c, d, f) => true); 

  Function(String) get changeNomeCavalo => _nomeCavaloController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _nomeCavaloController.close();
    _passwordController.close();
  }
}

//essa é a instância global e ela não será mais usada, pode apagar ou comentar
//final bloc = Bloc();

