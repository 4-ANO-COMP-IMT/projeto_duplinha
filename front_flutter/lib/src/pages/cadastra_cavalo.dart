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
        emailField(bloc),
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

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      //Stream que, quando atualizado, produz um snapshot
      //Observe como usamos o Stream definido no bloco
      stream: bloc.email,
      //Função que, quando chamada, causa a atualização do Widget
      //Empacotado pelo Stream Builder
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //Dica que aparece quando o usuário clica
            hintText: "seu@email.com",
            //Rótulo flutuante
            labelText: "Endereço de e-mail",
            //O erro não necessariamente é String, por isso o seu tipo é Object? e usamos o toString
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

