import 'proprietario_raw.dart';

class Proprietario {
  final ProprietarioRaw proprietario;

  Proprietario(this.proprietario);

  String get id => proprietario.id ;

  String get nome => proprietario.escreveNomeCompleto() ;

  String get dataNascimento => proprietario.formataData() ;

  String get cpf => proprietario.escreveCpf() ;

  String get genero => proprietario.genero;

  String get telefone => proprietario.telefone ;

  List<String> get cavalos => proprietario.cavalos ;

  String get logradouro => proprietario.logradouro;

  String get idade => '${proprietario.calcularIdade()}';

  String? get complemento => proprietario.complemento ;

  String get cidade => proprietario.cidade ;

  String get estado => proprietario.escreveEstado() ;

  String get email => proprietario.email ;

  String get nomeContatoEmergencia => proprietario.nomeContatoEmergencia ;

  String get telefoneContatoEmergencia => proprietario.telefoneContatoEmergencia ;
}
