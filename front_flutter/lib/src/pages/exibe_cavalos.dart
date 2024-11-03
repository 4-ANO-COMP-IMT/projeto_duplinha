import 'package:flutter/material.dart';
import '../components/cartao.dart';
import '../components/cavalo_widget.dart';
import '../models/cavalo.dart';
import '../models/cavalo_raw.dart';
import '../services/cavalo_service.dart';
import '../../routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        title: const Text('Cavalos Cadastrados'),
        centerTitle: true,
        leading: null,
        actions: <Widget>[
          FilledButton.tonal(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.cadastraCavalo);
            },
            child: Text('Cadastrar cavalo'),
          ),
        ],
      ),
      drawer: menuDrawer(context),
      body: ListView.builder(
        padding: EdgeInsets.only(
          left: 200,
          right: 200,
          top: 20,
          bottom: 20,
        ),
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

  Widget menuDrawer(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(

        ),
        children: [
          DrawerHeader(
            child: Text("Menu"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.horseHead),
            title: Text("Cavalos"),
            onTap: () => {Navigator.pushReplacementNamed(context, AppRoutes.exibeCavalos)},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.solidUser),
            title: Text("Proprietários"),
            onTap: () => {Navigator.pushReplacementNamed(context, AppRoutes.exibeProprietarios)},
          ),
        ],
      ),
    );
  }
}