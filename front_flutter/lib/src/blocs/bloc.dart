import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //StreamController vem do pacote dart:async
  final _emailController = StreamController <String> ();
  final _passwordController = StreamController <String> ();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get emailPasswordAreOkay => CombineLatestStream.combine2(email, password, (e, p) => true); 

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

//essa é a instância global e ela não será mais usada, pode apagar ou comentar
//final bloc = Bloc();

