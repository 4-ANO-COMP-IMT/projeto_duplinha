import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/proprietario_raw.dart';

class ProprietarioService {
  final String apiUrl = 'http://localhost:31498/cavalos';

  Future<List<ProprietarioRaw>> fetchProprietarios() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProprietarioRaw(
        id: item['idProprietario'],
        nome: item['infos']['nome'],
        sobrenome: item['infos']['sobrenome'],
        cpf: item['infos']['cpf'],
        genero: item['infos']['genero'],
        dataNascimento: item['infos']['dt_nasc'],
        telefone: item['infos']['telefone'],
        logradouro: item['infos']['endereco']['logradouro'],
        complemento: item['infos']['endereco']['complemento'],
        cidade: item['infos']['endereco']['cidade'],
        estado: item['infos']['endereco']['estado'],
        email: item['infos']['email'],
        nomeContatoEmergencia: item['infos']['nomeContatoEmergencia'],
        telefoneContatoEmergencia: item['infos']['telefoneContatoEmergencia'],
        cavalos: List<String>.from(item['infos']['id_cavalos'] ?? []),
      )).toList();
    } else {
      throw Exception('Falha ao carregar dados dos proprietarios');
    }
  }

  Future<void> addProprietario(ProprietarioRaw proprietario) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'nome': proprietario.nome,
        'sobrenome': proprietario.sobrenome,
        'cpf': proprietario.cpf,
        'genero': proprietario.genero,
        'dt_nasc': proprietario.dataNascimento,
        'telefone': proprietario.telefone,
        'endereco': {
          'logradouro': proprietario.logradouro,
          'complemento': proprietario.complemento,
          'cidade': proprietario.cidade,
          'estado': proprietario.estado,
        },
        'email': proprietario.email,
        'nomeContatoEmergencia': proprietario.nomeContatoEmergencia,
        'telefoneContatoEmergencia': proprietario.telefoneContatoEmergencia,
        'id_cavalos': proprietario.cavalos,
      })
    );

    if(response.statusCode != 201) {
      throw Exception('Falha ao cadastrar o proprietário');
    }
  }
}
