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
        passwordField(bloc),
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

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Senha",
            labelText: "Senha",
            errorText: snapshot.hasError? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailPasswordAreOkay,
      builder: (context, AsyncSnapshot<bool> snapshot){
         return ElevatedButton(
          onPressed: snapshot.hasData ? (){} : null, //ainda não temos o que fazer, função vazia
          child: Text('Login')
        );
      },
    );
  }
}

