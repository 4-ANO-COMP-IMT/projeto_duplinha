import 'cavalo_raw.dart';

class Cavalo {
  final CavaloRaw cavalo;

  Cavalo(this.cavalo);

  String get id => cavalo.id ;

  String get raca => cavalo.raca ;

  String get dataNascimento => cavalo.dataNascimento ;

  String get pelagem => cavalo.pelagem ;

  String get castrado => cavalo.castrado;

  String get chip => cavalo.chip ;

  List<String> get proprietarios => cavalo.proprietarios ;

  String get nome => cavalo.nome;

  String get idade => '${cavalo.calcularIdade()}';

  String get sexo => cavalo.escreveSexo() ;

  String get registro => cavalo.escreveRegistro() ;

  String get baia => cavalo.escreveBaia() ;
}
