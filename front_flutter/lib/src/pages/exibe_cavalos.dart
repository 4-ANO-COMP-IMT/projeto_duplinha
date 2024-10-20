import 'package:flutter/material.dart';
import '../components/cartao.dart';
import '../components/cavalo_widget.dart';
import '../models/cavalo.dart';
import '../models/cavalo_raw.dart';
import '../services/cavalo_service.dart';

class ExibeCavalos extends StatefulWidget {
  @override
  _ExibeCavalosState createState() => _ExibeCavalosState();
}

class _ExibeCavalosState extends State<ExibeCavalos> {
  List<Cavalo>? cavalos;
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    fetchCavalos();
  }

  Future<void> fetchCavalos() async {
    try {
      CavaloService service = CavaloService();
      List<CavaloRaw> dadosCavalos = await service.fetchCavalos();
      cavalos = dadosCavalos.map((cavaloRaw) => Cavalo(cavaloRaw)).toList();
    } catch (e) {
      erro = e.toString();
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    if (erro != null) {
      return Center(child: Text(erro!));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cavalos cadastrados'),
        centerTitle: true,
        actions: const <Widget>[
          FilledButton.tonal(
            onPressed: null, //() {
              //Navigator.pushNamed(context, '/cadastra-cavalo');
            //},
            child: Text('Cadastrar cavalo'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cavalos?.length,
        itemBuilder: (context, index) {
          final cavalo = cavalos![index];

          return Cartao(
            onTap: () {
              //Navigator.pushNamed(context, '/cavalo:idCavalo');
            },
            child: CavaloWidget(
              nome: cavalo.nome,
              baia: cavalo.baia,
              pelagem: cavalo.pelagem,
            ),
          );
        },
      ),
    );
  }
}