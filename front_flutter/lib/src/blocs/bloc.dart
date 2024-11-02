import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

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
  Stream<bool> get fieldsAreOkay => CombineLatestStream.combine8(
      nomeCavalo, 
      racaCavalo, 
      dtNascCavalo, 
      pelagemCavalo, 
      castradoCavalo, 
      sexoCavalo,
      init,
      chipCavalo,
      (n, r, d, p, c, s, v, h) => true);
  Stream<bool> get registryFieldsAreOkay => CombineLatestStream.combine2(
    tipoRegistroCavalo,
    numeroRegistroCavalo,
    (tp, num) => validateRegistro(tp, num));
  Stream<bool> get allFieldsAreOkay => CombineLatestStream.combine2(
    fieldsAreOkay,
    registryFieldsAreOkay,
    (m, r) => validateForm(m, r));

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

  void submitCavaloForm() {
    final nome = _nomeCavaloController.value;
    final raca = _racaCavaloController.value;
    final dt_nasc = _dtNascCavaloController.value;
    final pelagem = _pelagemCavaloController.value;
    final castrado = _castradoCavaloController.value;
    final sexo = _sexoCavaloController.value;
    final num_reg = _numeroRegistroCavaloController.valueOrNull;
    final num_chip = _chipCavaloController.valueOrNull;
    final tipo_reg = _tipoRegistroCavaloController.valueOrNull;
    final baia = _baiaCavaloController.valueOrNull;
    print(nome);
    print(raca);
    print(dt_nasc);
    print(pelagem);
    print(castrado);
    print(sexo);
    print(num_reg);
    print(num_chip);
    print(tipo_reg);
    print(baia);
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

//essa é a instância global e ela não será mais usada, pode apagar ou comentar
//final bloc = Bloc();

