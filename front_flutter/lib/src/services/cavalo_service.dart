import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cavalo_raw.dart';
import '../models/cavalo.dart';

class CavaloService {
  final String apiUrl = 'http://localhost:31661/cavalos';

  Future<List<CavaloRaw>> fetchCavalos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => CavaloRaw(
        id: item['idCavalo'],
        nome: item['infos']['nome'],
        baia: item['infos']['baia'],
        pelagem: item['infos']['pelagem'],
        dataNascimento: item['infos']['dt_nasc'],
        sexo: item['infos']['sexo'],
        numReg: item['infos']['num_reg'],
        tipoReg: item['infos']['tipo_reg'],
        chip: item['infos']['num_chip'],
        raca: item['infos']['raca'],
        castrado: item['infos']['castrado'],
        proprietarios: List<String>.from(item['infos']['id_proprietarios'] ?? []),
      )).toList();
    } else {
      throw Exception('Falha ao carregar dados dos cavalos');
    }
  }

  Future<Cavalo?> fetchCavalo(idCavalo) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<CavaloRaw>listaCavalos = data.map((item) => CavaloRaw(
        id: item['idCavalo'],
        nome: item['infos']['nome'],
        baia: item['infos']['baia'],
        pelagem: item['infos']['pelagem'],
        dataNascimento: item['infos']['dt_nasc'],
        sexo: item['infos']['sexo'],
        numReg: item['infos']['num_reg'],
        tipoReg: item['infos']['tipo_reg'],
        chip: item['infos']['num_chip'],
        raca: item['infos']['raca'],
        castrado: item['infos']['castrado'],
        proprietarios: List<String>.from(item['infos']['id_proprietarios'] ?? []),
      )).toList();

      for(final cavalo in listaCavalos){
        if(cavalo.id == idCavalo){
          return Cavalo(cavalo);
        }
      } return null;
    } else {
      throw Exception('Falha ao carregar dados dos cavalos');
    }
  }

  Future<void> addCavalo(CavaloRaw cavalo) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'nome': cavalo.nome,
        'baia': cavalo.baia,
        'pelagem': cavalo.pelagem,
        'dt_nasc': cavalo.dataNascimento,
        'sexo': cavalo.sexo,
        'num_reg': cavalo.numReg,
        'tipo_reg': cavalo.tipoReg,
        'num_chip': cavalo.chip,
        'raca': cavalo.raca,
        'castrado': cavalo.castrado,
        'id_proprietarios':[],
      })
    );

    if(response.statusCode != 201) {
      throw Exception('Falha ao cadastrar o cavalo');
    }
  }
}
