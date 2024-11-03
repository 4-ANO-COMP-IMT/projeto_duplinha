import 'package:flutter/material.dart';
import '../../routes.dart';
import '../services/proprietario_service.dart';
import '../models/proprietario.dart';

class ExibeProprietario extends StatefulWidget {
   final String idProprietario;

  const ExibeProprietario({Key? key, required this.idProprietario}) : super(key: key);
  @override
  _ExibeProprietarioState createState() => _ExibeProprietarioState();
}

class _ExibeProprietarioState extends State<ExibeProprietario> {
  Proprietario? proprietario;
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    fetchProprietario(widget.idProprietario);
  }

  Future<void> fetchProprietario(idCavalo) async {
      try {
        ProprietarioService service = ProprietarioService();
        proprietario = await service.fetchProprietario(idProprietario);
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
          title: Text(proprietario!.nome),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.exibeProprietarios);
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
                  "CPF: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.cpf),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Gênero: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.genero),
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
                Text(proprietario!.dataNascimento),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Telefone: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.telefone),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                  "Endereço: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 15
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Logradouro: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(proprietario!.logradouro),
                        ]
                      ),
                      Row(
                        children: [
                          Text(
                            "Complemento: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(proprietario!.complemento!),
                        ]
                      ),
                      Row(
                        children: [
                          Text(
                            "Cidade: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(proprietario!.cidade),
                        ]
                      ),
                      Row(
                        children: [
                          Text(
                            "Estado: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(proprietario!.estado),
                        ]
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "E-mail: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.email),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Nome do contatdo de emergência: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.nomeContatoEmergencia),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  "Telefone do contato de emergência: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(proprietario!.telefoneContatoEmergencia),
              ],
            ),
          ],
        ),
      ),
    );
  }
}