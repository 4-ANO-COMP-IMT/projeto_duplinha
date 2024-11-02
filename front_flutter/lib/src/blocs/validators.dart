import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';

mixin Validators {
  final validateTexto = StreamTransformer<String, String>.fromHandlers(
    handleData: (texto, sink) {
      if (texto.length > 0) {
        sink.add(texto);
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

  final validateData = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      try {
        data = DateFormat.yMd('pt_BR').parseStrict(data).toString().split(' ')[0];
        sink.add(data);
      } catch (e) {
        sink.addError("Esta data não é válida");
      }
    }
  );
}