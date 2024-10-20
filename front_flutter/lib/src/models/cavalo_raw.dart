class CavaloRaw {
  final String id;
  final String nome;
  final String raca;
  final String dataNascimento;
  final String baia;
  final String pelagem;
  final String sexo;
  final String castrado;
  final String numReg;
  final String tipoReg;
  final String chip;
  final List<String> proprietarios;

  CavaloRaw({
    required this.id, 
    required this.nome, 
    required this.baia, 
    required this.pelagem,
    required this.dataNascimento,
    required this.raca,
    required this.sexo,
    required this.castrado,
    required this.numReg,
    required this.tipoReg,
    required this.chip,
    required this.proprietarios,
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

  // Formata o sexo
  String escreveSexo() {
    return sexo == "F" ? "Fêmea" : "Macho";
  }

  // Formata o registro
  String escreveRegistro() {
    if (tipoReg == "Provisório") {
      return "$numReg/P";
    } else if (tipoReg == "Definitivo") {
      return "$numReg/D";
    } else {
      return "Sem registro";
    }
  }

  // Formata a baia
  String escreveBaia() {
    return baia.isNotEmpty ? baia : "Pasto";
  }
}
