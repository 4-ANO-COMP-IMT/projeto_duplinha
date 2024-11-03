import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import '../services/cavalo_service.dart';
import '../models/cavalo_raw.dart';
import '../../routes.dart';
import 'package:flutter/material.dart';

class Bloc with Validators {
  final _nomeCavaloController = BehaviorSubject <String> ();
  final _racaCavaloController = BehaviorSubject <String> ();
  final _dtNascCavaloController = BehaviorSubject <String> ();
  final _pelagemCavaloController = BehaviorSubject <String> ();
  final _castradoCavaloController = BehaviorSubject <String> ();
  final _sexoCavaloController = BehaviorSubject <String> ();
  final _tipoRegistroCavaloController = BehaviorSubject <String> ();
  final _numeroRegistroCavaloController = BehaviorSubject <String> ();
  final _chipCavaloController = BehaviorSubject <String> ();
  final _baiaCavaloController = BehaviorSubject <String> ();
  final _initController = BehaviorSubject <String> ();
  final cavaloService = CavaloService();

  final _nomeProprietarioController = BehaviorSubject <String> ();
  final _sobrenomeProprietarioController = BehaviorSubject <String> ();
  final _cpfProprietarioController = BehaviorSubject <String> ();
  final _generoProprietarioController = BehaviorSubject <String> ();
  final _dtNascProprietarioController = BehaviorSubject <String> ();
  final _telefoneProprietarioController = BehaviorSubject <String> ();
  final _enderecoProprietarioController = BehaviorSubject <String> ();
  final _logradouroProprietarioController = BehaviorSubject <String> ();
  final _complementoProprietarioController = BehaviorSubject <String> ();
  final _cidadeProprietarioController = BehaviorSubject <String> ();
  final _estadoProprietarioController = BehaviorSubject <String> ();
  final _emailProprietarioController = BehaviorSubject <String> ();
  final _nomeContatoEmergenciaProprietarioController = BehaviorSubject <String> ();
  final _telefoneContatoEmergenciaProprietarioController = BehaviorSubject <String> ();
  final proprietarioService = ProprietarioService();

  Bloc() {
    _tipoRegistroCavaloController.add("");
    _numeroRegistroCavaloController.add("");
    _chipCavaloController.add("");
    _initController.add("");
  }

  Stream<String> get nomeCavalo => _nomeCavaloController.stream.transform(validateTexto);
  Stream<String> get racaCavalo => _racaCavaloController.stream.transform(validateTexto);
  Stream<String> get dtNascCavalo => _dtNascCavaloController.stream.transform(validateData);
  Stream<String> get pelagemCavalo => _pelagemCavaloController.stream.transform(validateTexto);
  Stream<String> get castradoCavalo => _castradoCavaloController.stream.transform(validateTexto);
  Stream<String> get sexoCavalo => _sexoCavaloController.stream.transform(validateTexto);
  Stream<String> get tipoRegistroCavalo => _tipoRegistroCavaloController.stream.transform(validateOpcional);
  Stream<String> get numeroRegistroCavalo => _numeroRegistroCavaloController.stream.transform(validateNumeroRegistro);
  Stream<String> get chipCavalo => _chipCavaloController.stream.transform(validateChip);
  Stream<String> get baiaCavalo => _baiaCavaloController.stream.transform(validateOpcional);
  Stream<String> get init => _initController.stream.transform(validateInit);
  Stream<bool> get fieldsAreOkay => CombineLatestStream.combine7(
      nomeCavalo, 
      racaCavalo, 
      dtNascCavalo, 
      pelagemCavalo, 
      castradoCavalo, 
      sexoCavalo,
      chipCavalo,
      (n, r, d, p, c, s, h) => true);
  Stream<bool> get registryFieldsAreOkay => CombineLatestStream.combine2(
    tipoRegistroCavalo,
    numeroRegistroCavalo,
    (tp, num) => validateRegistro(tp, num));
  Stream<bool> get allFieldsAreOkay => CombineLatestStream.combine2(
    fieldsAreOkay,
    registryFieldsAreOkay,
    (m, r) => validateForm(m, r));


  Stream<String> get nomeProprietario => _nomeProprietarioController.stream.transform(validateTexto);
  Stream<String> get sobrenomeProprietario => _sobrenomeProprietarioController.stream.transform(validateTexto);
  Stream<String> get cpfProprietario => _cpfProprietarioController.stream.transform(validateCpf);
  Stream<String> get generoProprietario => _generoProprietarioController.stream.transform(validateTexto);
  Stream<String> get dtNascProprietario => _dtNascProprietarioController.stream.transform(validateData);
  Stream<String> get telefoneProprietario => _telefoneProprietarioController.stream.transform(validateTelefone);
  Stream<String> get enderecoProprietario => _enderecoProprietarioController.stream.transform(validateTexto); //Fazer um combine do endereço?
  Stream<String> get logradouroProprietario => _logradouroProprietarioController.stream.transform(validateTexto);
  Stream<String> get complementoProprietario => _complementoProprietarioController.stream.transform(validateOpcional);
  Stream<String> get cidadeProprietario => _cidadeProprietarioController.stream.transform(validateTexto);
  Stream<String> get estadoProprietario => _estadoProprietarioController.stream.transform(validateEstado);
  Stream<String> get emailProprietario => _emailProprietarioController.stream.transform(validateEmail);
  Stream<String> get nomeContatoEmergenciaProprietario => _nomeContatoEmergenciaProprietarioController.stream.transform(validateTexto);
  Stream<String> get telefoneContatoEmergenciaProprietario => _telefoneContatoEmergenciaProprietarioController.stream.transform(validateTelefone);

  Function(String) get changeNomeCavalo => _nomeCavaloController.sink.add;
  Function(String) get changeRacaCavalo => _racaCavaloController.sink.add;
  Function(String) get changeDtNascCavalo => _dtNascCavaloController.sink.add;
  Function(String) get changePelagemCavalo => _pelagemCavaloController.sink.add;
  Function(String) get changeCastradoCavalo => _castradoCavaloController.sink.add;
  Function(String) get changeSexoCavalo => _sexoCavaloController.sink.add;
  Function(String) get changeTipoRegistroCavalo => _tipoRegistroCavaloController.sink.add;
  Function(String) get changeNumeroRegistroCavalo => _numeroRegistroCavaloController.sink.add;
  Function(String) get changeChipCavalo => _chipCavaloController.sink.add;
  Function(String) get changeBaiaCavalo => _baiaCavaloController.sink.add;

  Function(String) get changeNomeProprietario => _nomeProprietarioController.sink.add;
  Function(String) get changeSobrenomeProprietario => _sobrenomeProprietarioController.sink.add;
  Function(String) get changeCpfProprietario => _cpfProprietarioController.sink.add;
  Function(String) get changeGeneroProprietario => _generoProprietarioController.sink.add;
  Function(String) get changeDtNascProprietario => _dtNascProprietarioController.sink.add;
  Function(String) get changeTelefoneProprietario => _telefoneProprietarioController.sink.add;
  Function(String) get changeEnderecoProprietario => _enderecoProprietarioController.sink.add;
  Function(String) get changeLogradouroProprietario => _logradouroProprietarioController.sink.add;
  Function(String) get changeComplementoProprietario => _complementoProprietarioController.sink.add;
  Function(String) get changeCidadeProprietario => _cidadeProprietarioController.sink.add;
  Function(String) get changeEstadoProprietario => _estadoProprietarioController.sink.add;
  Function(String) get changeNomeContatoEmergenciaProprietario => _nomeContatoEmergenciaProprietarioController.sink.add;
  Function(String) get changeTelefoneContatoEmergenciaProprietario => _telefoneContatoEmergenciaProprietarioController.sink.add;

  void submitCavaloForm(context) {
    final cavaloService = CavaloService();

    CavaloRaw novoCavalo = CavaloRaw(
      id: "",
      nome: _nomeCavaloController.value,
      baia:  _baiaCavaloController.valueOrNull,
      pelagem: _pelagemCavaloController.value,
      dataNascimento: _dtNascCavaloController.value,
      sexo: _sexoCavaloController.value,
      numReg: _numeroRegistroCavaloController.valueOrNull,
      tipoReg: _tipoRegistroCavaloController.valueOrNull,
      chip:  _chipCavaloController.valueOrNull,
      raca: _racaCavaloController.value,
      castrado: _castradoCavaloController.value,
      proprietarios: [],
    );

    try {
      cavaloService.addCavalo(novoCavalo);
      print("cavalo adicionado"); // MELHORIA: adicionar um toast ou uma mensagem indicando que o cadastro deu certo
      clean();
      Navigator.pushNamed(context, AppRoutes.exibeCavalos);
    } catch (erro) {
      print("Erro ao adicionar cavalo: $erro"); // MELHORIA: exibir esse erro na tela
    }

  }

  void clean() {
    _tipoRegistroCavaloController.add("");
    _castradoCavaloController.add("");
    _sexoCavaloController.add("");
  }
  

  void dispose() {
    _nomeCavaloController.close();
    _racaCavaloController.close();
    _dtNascCavaloController.close();
    _pelagemCavaloController.close();
    _castradoCavaloController.close();
    _sexoCavaloController.close();
    _tipoRegistroCavaloController.close();
    _numeroRegistroCavaloController.close();
    _chipCavaloController.close();
    _baiaCavaloController.close();
  }
}

