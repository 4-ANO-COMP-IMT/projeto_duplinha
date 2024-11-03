import 'package:flutter/material.dart';
import '../components/cartao.dart';
import '../components/proprietario_widget.dart';
import '../models/proprietario.dart';
import '../models/proprietario_raw.dart';
import '../services/proprietario_service.dart';
import '../../routes.dart';

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
          onPressed: fetchProprietarios,
          child: Text('Recarregar Página')
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
              Navigator.pushNamed(context, AppRoutes.cadastraProprietario);
            },
            child: Text('Cadastrar proprietário'),
          ),
        ],
      ),
      body: ListView.builder(
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
}