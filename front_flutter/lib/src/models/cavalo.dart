class Cavalo {
  final int id;
  final String nome;
  final String raca;
  final String idade;
  final String baia;
  final String pelagem;
  final String sexo;
  final String castrado;
  final String registro;
  final String chip;
  final List<String> proprietarios;

  Cavalo({
    required this.id, 
    required this.nome, 
    required this.baia, 
    required this.pelagem,
    required this.idade,
    required this.raca,
    required this.sexo,
    required this.castrado,
    required this.registro,
    required this.chip,
    required this.proprietarios,
    });

  factory Cavalo.fromJson(Map<String, dynamic> json) {
    return Cavalo(
      id: json['idCavalo'],
      nome: json['infos']['nome'],
      raca: json['infos']['raca'],
      idade: json['infos']['idade'],
      pelagem: json['infos']['pelagem'],
      sexo: json['infos']['sexo'],
      castrado: json['infos']['castrado'],
      registro: json['infos']['registro'],
      chip: json['infos']['num_chip'],
      baia: json['infos']['baia'],
      proprietarios: json['infos']['id_proprietarios'],
    );
  }
}
