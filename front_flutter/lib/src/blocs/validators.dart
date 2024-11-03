import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import '../models/cavalo.dart';
import '../models/proprietario.dart';

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

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (EmailValidator.validate(email)) {
        sink.add(email);
      } else {
        sink.addError("E-mail inválido");
      }
    }
  );

  final validateEstado = StreamTransformer<String, String>.fromHandlers(
    handleData: (estado, sink) {
      final listaEstados = ["AC", "AL", "AP", "AM", "BA", "CE", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"];
      if(listaEstados.contains(estado)){
        sink.add(estado);
      } else {
        return sink.addError("Sigla de estado inválido");
      }
    }
  );

  final validateCpf = StreamTransformer<String, String>.fromHandlers(
    handleData: (cpf, sink) {
      if (CPFValidator.isValid(cpf)) {
        sink.add(cpf);
      } else {
        sink.addError("CPF inválido");
      }
    }
  );

  final validateNumero = StreamTransformer<String, String>.fromHandlers(
    handleData: (num, sink) {
      if (RegExp(r'^[0-9]+$').hasMatch(num)) {
        sink.add(num);
      } else {
        sink.addError("Digite apenas números");
      }
    }
  );

  final validateCavalo = StreamTransformer<Cavalo, Cavalo>.fromHandlers(
    handleData: (cavalo, sink) {
      sink.add(cavalo);
    }
  );

  final validateProprietario = StreamTransformer<Proprietario, Proprietario>.fromHandlers(
    handleData: (proprietario, sink) {
      sink.add(proprietario);
    }
  );
}