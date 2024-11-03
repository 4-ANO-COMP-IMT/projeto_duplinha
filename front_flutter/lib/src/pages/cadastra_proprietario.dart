import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import '../../routes.dart';

class CadastraProprietario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Proprietário'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            bloc.clean();
            Navigator.pushNamed(context, AppRoutes.exibeProprietarios);
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
        //selecionaCavalosField(bloc),
        //SizedBox(height: 20,),
        nomeProprietarioField(bloc),
        SizedBox(height: 20,),
        sobrenomeProprietarioField(bloc),
        SizedBox(height: 20,),
        cpfProprietarioField(bloc),
        SizedBox(height: 20,),
        generoProprietarioField(bloc),
        SizedBox(height: 20,),
        dtNascProprietarioField(bloc),
        SizedBox(height: 20,),
        telefoneProprietarioField(bloc),
        SizedBox(height: 20,),
        enderecoProprietarioField(bloc),
        SizedBox(height: 20,),
        emailProprietarioField(bloc),
        SizedBox(height: 20,),
        nomeContatoEmergenciaProprietarioField(bloc),
        SizedBox(height: 20,),
        telefoneContatoEmergenciaProprietarioField(bloc),
        Container(
          margin: EdgeInsets.only(top: 25.0),
          child: Row(
            children: [
              Expanded(
                child: submitButton(bloc)
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget selecionaCavalosField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.nomeCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeNomeCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Nome do cavalo",
            labelText: "Nome*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget nomeProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.nomeProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeNomeProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Nome",
            labelText: "Nome*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget sobrenomeProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.sobrenomeProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeSobrenomeProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Sobrenome",
            labelText: "Sobrenome*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget cpfProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.cpfProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeCpfProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Ex.: 12345678901",
            labelText: "CPF*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget generoProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.generoProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeGeneroProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Gênero*",
            hintText: "Ex.: Mulher trans",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget dtNascProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.dtNascProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeDtNascProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "DD/MM/AAAA",
            labelText: "Data de Nascimento*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget telefoneProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.telefoneProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeTelefoneProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "11912345678",
            labelText: "Telefone*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

   Widget enderecoProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.enderecoProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Endereço*',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(
                left: 15
              ),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: bloc.logradouroProprietario,
                    builder: ((context, AsyncSnapshot<String> snapshot) {
                      return TextField(
                        onChanged: bloc.changeLogradouroProprietario,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Ex.: Rua das Flores, 100",
                          labelText: "Logradouro*",
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        ),
                      );
                    })
                  ),
                  SizedBox(height: 20,),
                  StreamBuilder(
                    stream: bloc.complementoProprietario,
                    builder: ((context, AsyncSnapshot<String> snapshot) {
                      return TextField(
                        onChanged: bloc.changeComplementoProprietario,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Ex.: Bloco A, Apt 200",
                          labelText: "Complemento",
                        ),
                      );
                    })
                  ),
                  SizedBox(height: 20,),
                  StreamBuilder(
                    stream: bloc.cidadeProprietario,
                    builder: ((context, AsyncSnapshot<String> snapshot) {
                      return TextField(
                        onChanged: bloc.changeCidadeProprietario,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Ex.: São Bernardo do Campo",
                          labelText: "Cidade*",
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        ),
                      );
                    })
                  ),
                  SizedBox(height: 20,),
                  StreamBuilder(
                    stream: bloc.estadoProprietario,
                    builder: ((context, AsyncSnapshot<String> snapshot) {
                      return TextField(
                        onChanged: bloc.changeEstadoProprietario,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Ex.: SP",
                          labelText: "Estado*",
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        ),
                      );
                    })
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget emailProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeEmailProprietario,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "seu@email.com",
            labelText: "Endereço de e-mail*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget nomeContatoEmergenciaProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.nomeContatoEmergenciaProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeNomeContatoEmergenciaProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Nome do contato de emergência",
            labelText: "Nome do contato de emergência*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget telefoneContatoEmergenciaProprietarioField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.telefoneContatoEmergenciaProprietario,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeTelefoneContatoEmergenciaProprietario,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "11912345678",
            labelText: "Telefone do contato de emergência*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.allFieldsAreOkay,
      builder: (context, AsyncSnapshot<bool> snapshot){
         return ElevatedButton(
          onPressed: !snapshot.hasData ? null : snapshot.requireData ? (){bloc.submitCavaloForm(context);} : null,
          child: Text('Cadastrar')
        );
      },
    );
  }
}