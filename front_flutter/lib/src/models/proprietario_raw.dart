import 'package:cpf_cnpj_validator/cpf_validator.dart';

class ProprietarioRaw {
  final String id;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String genero;
  final String dataNascimento;
  final String telefone;
  final String logradouro;
  final String? complemento;
  final String cidade;
  final String estado;
  final String email;
  final String nomeContatoEmergencia;
  final String telefoneContatoEmergencia;
  final List<String> cavalos;

  ProprietarioRaw({
    required this.id, 
    required this.nome, 
    required this.sobrenome, 
    required this.cpf,
    required this.genero,
    required this.dataNascimento,
    required this.telefone,
    required this.logradouro,
    required this.complemento,
    required this.cidade,
    required this.estado,
    required this.email,
    required this.nomeContatoEmergencia,
    required this.telefoneContatoEmergencia,
    required this.cavalos,
    });


   // Cálculo da idade
  int calcularIdade() {
    final hoje = DateTime.now();
    final nascimento = DateTime.parse(dataNascimento);
    int idade = hoje.year - nascimento.year;
    if (hoje.month < nascimento.month || (hoje.month == nascimento.month && hoje.day < nascimento.day)) {
      idade--;
    }
    return idade;
  }

  // Formata data
  String formataData() {
    final dataFormat = DateTime.parse(dataNascimento).day.toString() + "/" + DateTime.parse(dataNascimento).month.toString() + "/" + DateTime.parse(dataNascimento).year.toString();
    return dataFormat;
  }

  // Formata o nome
  String escreveNomeCompleto() {
    return nome + " " + sobrenome;
  }

  // Formata o CPF
  String escreveCpf() {
    return CPFValidator.format(cpf);
  }

  //Formata complemento
  String escreveComplemento() {
    if(complemento != null){
      return complemento!;
    } else {
      return "Sem complemento" ;
    }
  }

  // Formata o estado
  String escreveEstado() {
    switch (estado) {
      case "AC":
        return "Acre";
      case "AL":
        return "Alagoas";
      case "AP":
        return "Amapá";
      case "AM":
        return "Amazonas";
      case "BA":
        return "Bahia";
      case "CE":
        return "Ceará";
      case "DF":
        return "Distrito Federal";
      case "ES":
        return "Espírito Santos";
      case "GO":
        return "Goiás";
      case "MA":
        return "Maranhão";
      case "MT":
        return "Mato Grosso";
      case "MS":
        return "Mato Grosso do Sul";
      case "MG":
        return "Minas Gerais";
      case "PA":
        return "Pará";
      case "PB":
        return "Paraíba";
      case "PE":
        return "Pernambuco";
      case "PI":
        return "Piauí";
      case "RJ":
        return "Rio de Janeiro";
      case "RN":
        return "Rio Grande do Norte";
      case "RO":
        return "Rondônia";
      case "RR":
        return "Roraima";
      case "SC":
        return "Santa Catarina";
      case "SP":
        return "São Paulo";
      case "SE":
        return "Sergipe";
      case "TO":
        return "Tocantins";
      default:
        return "Estado inválido: " + estado;
    }
  }
}
