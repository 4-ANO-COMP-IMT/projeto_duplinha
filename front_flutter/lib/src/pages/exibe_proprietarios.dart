import 'package:flutter/material.dart';
import '../components/cartao.dart';
import '../components/proprietario_widget.dart';
import '../models/proprietario.dart';
import '../models/proprietario_raw.dart';
import '../services/proprietario_service.dart';
import '../../routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ExibeProprietarios extends StatefulWidget {
  @override
  _ExibeProprietariosState createState() => _ExibeProprietariosState();
}

class _ExibeProprietariosState extends State<ExibeProprietarios> {
  List<Proprietario>? proprietarios;
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    fetchProprietarios();
  }

  Future<void> fetchProprietarios() async {
    try {
      ProprietarioService service = ProprietarioService();
      List<ProprietarioRaw> dadosProprietarios = await service.fetchProprietarios();
      proprietarios = dadosProprietarios.map((proprietarioRaw) => Proprietario(proprietarioRaw)).toList();
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
      return Center(
        child: TextButton(
          onPressed: () => {fetchProprietarios()},
          child: Text(erro!)
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proprietários Cadastrados'),
        centerTitle: true,
        leading: null,
        actions: <Widget>[
          FilledButton.tonal(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.cadastraProprietario);
            },
            child: Text('Cadastrar proprietário'),
          ),
        ],
      ),
      floatingActionButton: menuButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: ListView.builder(
        padding: EdgeInsets.only(
          left: 200,
          right: 200,
          top: 20,
          bottom: 20,
        ),
        itemCount: proprietarios?.length,
        itemBuilder: (context, index) {
          final proprietario = proprietarios![index];

          return Cartao(
            onTap: () {
              //Navigator.pushNamed(context, '/cavalo:idCavalo');
            },
            child: ProprietarioWidget(
              nome: proprietario.nome,
              telefone: proprietario.telefone,
              email: proprietario.email,
            ),
          );
        },
      ),
    );
  }

  Widget menuButton(context) {
    return PopupMenuButton(
      tooltip: "Menu",
      iconSize: 50,
      icon: Icon(Icons.dehaze_rounded),
      onSelected: (route) => {Navigator.pushReplacementNamed(context, route)},
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: AppRoutes.exibeCavalos,
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.horseHead),
            title: Text('Cavalos'),
          ),
        ),
        PopupMenuItem(
          value: AppRoutes.exibeProprietarios,
          child: ListTile(
            leading: FaIcon(FontAwesomeIcons.solidUser),
            title: Text('Proprietários'),
          ),
        ),
      ],
    );
  }
}