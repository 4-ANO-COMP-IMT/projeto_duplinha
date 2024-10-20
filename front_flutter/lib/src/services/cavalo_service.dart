import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cavalo_raw.dart';

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
}
