import 'dart:async';
import 'package:email_validator/email_validator.dart';

mixin Validators {
  final validateTexto = StreamTransformer<String, String>.fromHandlers(
    handleData: (nome, sink) {
      if (nome.length > 0) {
        sink.add(nome);
      } else {
        sink.addError("Este campo é obrigatório");
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.length > 3) {
        sink.add(email);
      } else {
        sink.addError("Senha deve ter, pelo menos, 4 caracteres");
      }
    }
  );
}