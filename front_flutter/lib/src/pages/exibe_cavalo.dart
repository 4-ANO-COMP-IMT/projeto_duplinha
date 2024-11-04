import 'package:flutter/material.dart';
import '../../routes.dart';
import '../services/cavalo_service.dart';
import '../models/cavalo.dart';

class ExibeCavalo extends StatefulWidget {
   final String idCavalo;

  const ExibeCavalo({Key? key, required this.idCavalo}) : super(key: key);
  @override
  _ExibeCavaloState createState() => _ExibeCavaloState();
}

class _ExibeCavaloState extends State<ExibeCavalo> {
  Cavalo? cavalo;
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    fetchCavalo(widget.idCavalo);
  }

  Future<void> fetchCavalo(idCavalo) async {
      try {
        CavaloService service = CavaloService();
        cavalo = await service.fetchCavalo(idCavalo);
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
          title: Text(cavalo!.nome),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.exibeCavalos);
              },
            ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
        left: 200,
        right: 200,
        top: 20,
        bottom: 20,
        ),
        child: Column (
          children: [
            Row(
              children: [
                Text(
                  "Raça: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.raca),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Idade: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.idade),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Data de Nascimento: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.dataNascimento),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Pelagem: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.pelagem),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Castrado: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.castrado),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Sexo: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.sexo),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Registro: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.registro),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Chip: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.chip),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Baia: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(cavalo!.baia),
              ],
            ),
          ],
        ),
      ),
    );
  }
}