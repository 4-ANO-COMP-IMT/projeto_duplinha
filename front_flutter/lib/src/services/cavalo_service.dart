import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cavalo_raw.dart';

class CavaloService {
  final String apiUrl = 'http://cavalos-clusterip-service:4000/cavalos';

  Future<List<Cavalo_raw>> fetchCavalos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Cavalo_raw(
        id: item['idCavalo'],
        nome: item['infos']['nome'],
        baia: item['infos']['baia'],
        pelagem: item['infos']['pelagem'],
        dataNascimento: item['infos']['dt_nasc'],
        sexo: item['infos']['sexo'],
        num_reg: item['infos']['num_reg'],
        tipo_reg: item['infos']['tipo_reg'],
        chip: item['infos']['num_chip']
      )).toList();
    } else {
      throw Exception('Falha ao carregar dados dos cavalos');
    }
  }
}
