import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class CadastraCavalo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
    margin: EdgeInsets.only(
      left: 200,
      right: 200,
      top: 20,
      bottom: 20,
    ),
    
    child: Column (
      children: [
        nomeCavaloField(bloc),
        racaCavaloField(bloc),
        Container(
          margin: EdgeInsets.only(top: 12, bottom: 12),
          child: dtNascCavaloField(bloc),
        ),
        Container(
          margin: EdgeInsets.only(top: 12.0),
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
    );
  }

  Widget nomeCavaloField(Bloc bloc) {
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

  Widget racaCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.racaCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeRacaCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Ex.: Lusitano",
            labelText: "Raça*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget dtNascCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.dtNascCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeDtNascCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Data de Nascimento*",
            hintText: "DD/MM/AAAA",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.mandatoryFieldsAreOkay,
      builder: (context, AsyncSnapshot<bool> snapshot){
         return ElevatedButton(
          onPressed: snapshot.hasData ? (){} : null, //ainda não temos o que fazer, função vazia
          child: Text('Cadastrar')
        );
      },
    );
  }
}

