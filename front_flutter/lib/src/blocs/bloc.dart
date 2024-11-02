import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  //StreamController vem do pacote dart:async
  final _nomeCavaloController = StreamController <String> ();
  final _racaCavaloController = StreamController <String> ();
  final _dtNascCavaloController = StreamController <String> ();
  final _pelagemCavaloController = StreamController <String> ();
  final _castradoCavaloController = StreamController <String> ();
  final _sexoCavaloController = StreamController <String> ();
  final _tipoRegistroCavaloController = StreamController <String> ();
  final _numeroRegistroCavaloController = StreamController <String> ();
  final _chipCavaloController = StreamController <String> ();
  final _baiaCavaloController = StreamController <String> ();

  Stream<String> get nomeCavalo => _nomeCavaloController.stream.transform(validateTexto);
  Stream<String> get racaCavalo => _racaCavaloController.stream.transform(validateTexto);
  Stream<String> get dtNascCavalo => _dtNascCavaloController.stream.transform(validateTexto);
  Stream<String> get pelagemCavalo => _pelagemCavaloController.stream.transform(validateTexto);
  Stream<String> get castradoCavalo => _castradoCavaloController.stream.transform(validateTexto);
  Stream<String> get sexoCavalo => _sexoCavaloController.stream.transform(validateTexto);
  Stream<String> get tipoRegistroCavalo => _tipoRegistroCavaloController.stream.transform(validateTexto);
  Stream<String> get numeroRegistroCavalo => _numeroRegistroCavaloController.stream.transform(validateTexto);
  Stream<String> get chipCavalo => _chipCavaloController.stream.transform(validateTexto);
  Stream<String> get baiaCavalo => _baiaCavaloController.stream.transform(validateTexto);
  Stream<bool> get mandatoryFieldsAreOkay => CombineLatestStream.combine6(
      nomeCavalo, 
      racaCavalo, 
      dtNascCavalo, 
      pelagemCavalo, 
      castradoCavalo, 
      sexoCavalo, 
      (n, r, d, p, c, s) => true); 

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

