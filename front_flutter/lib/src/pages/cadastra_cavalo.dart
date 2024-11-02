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
        dtNascCavaloField(bloc),
        pelagemCavaloField(bloc),
        castradoCavaloField(bloc),
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

  Widget pelagemCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.pelagemCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePelagemCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Ex.: Tordilho",
            labelText: "Pelagem*",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget castradoCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.castradoCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return Row(
          children: <Widget>[
            ListTile(
              title: Text('Sim'),
              leading: Radio<String>(
                onChanged: (String? value) {bloc.changeCastradoCavalo;},
                value: "Sim",
                groupValue: snapshot.data,
              ),
            ),
            ListTile(
              title: Text('Não'),
              leading: Radio<String>(
                onChanged: (String? value) {bloc.changeCastradoCavalo;},
                value: "Não",
                groupValue: snapshot.data,
              ),
            ),
          ],
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

