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

  final validateOpcional = StreamTransformer<String, String>.fromHandlers(
    handleData: (texto, sink) {
      if (texto.length > 0) {
        sink.add(texto);
      } else {
        sink.add("");
      }
    }
  );

  final validateNumeroRegistro = StreamTransformer<String, String>.fromHandlers(
    handleData: (num_reg, sink) {
      if (num_reg.length == 6 && RegExp(r'^[0-9]+$').hasMatch(num_reg)) {
        sink.add(num_reg);
      } else if(num_reg.length == 0) {
        sink.add("");
      } else {
        sink.addError("O número de registro possui 6 dígitos");
      }
    }
  );

  final validateChip = StreamTransformer<String, String>.fromHandlers(
    handleData: (num_chip, sink) {
      if (num_chip.length == 15 && RegExp(r'^[0-9]+$').hasMatch(num_chip)) {
        sink.add(num_chip);
      } else if(num_chip.length == 0) {
        sink.add("");
      } else {
        sink.addError("O número do chip possui 15 dígitos");
      }
    }
  );

  bool validateRegistro(tp, num) {
    if(tp.length > 0 && num.length > 0){
        //print('T1 tp: '+tp);
        //print('T1 num: '+num);
        return true;
      } else if((tp.length == 0 || tp == null) && (num.length == 0 || num == null)) {
        //print('T2 tp: '+tp);
        //print('T2 num: '+num);
        return true;
      } else {
        //print('F1 tp: '+tp);
        //print('F1 num: '+num);
        return false;
      }
  }

  bool validateForm(m, r) {
    if(m == true && r == true){
      return true;
    } else {
      return false;
    }
  }

  final validateInit = StreamTransformer<String, String>.fromHandlers(
    handleData: (init, sink) {
      sink.add(init);
    }
  );
}