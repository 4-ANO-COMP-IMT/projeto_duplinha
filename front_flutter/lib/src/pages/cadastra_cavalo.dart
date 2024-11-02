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
        SizedBox(height: 20,),
        racaCavaloField(bloc),
        SizedBox(height: 20,),
        dtNascCavaloField(bloc),
        SizedBox(height: 20,),
        pelagemCavaloField(bloc),
        SizedBox(height: 20,),
        castradoCavaloField(bloc),
        SizedBox(height: 20,),
        //sexoCavaloField(bloc),
        //tipoRegistroCavaloField(bloc),
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Castrado?*'),
            SizedBox(height: 5,),
            Row(
              children: <Widget>[
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeCastradoCavalo(value!);},
                      value: "Sim",
                      groupValue: snapshot.data,
                    ),
                    Text('Sim'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeCastradoCavalo(value!);},
                      value: "Não",
                      groupValue: snapshot.data,
                    ),
                    Text('Não'),
                  ],
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget sexoCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.sexoCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return Row(
          children: <Widget>[
            ListTile(
              title: Text('Fêmea'),
              leading: Radio<String>(
                onChanged: (String? value) {bloc.changeSexoCavalo;},
                value: "F",
                groupValue: snapshot.data,
              ),
            ),
            ListTile(
              title: Text('Macho'),
              leading: Radio<String>(
                onChanged: (String? value) {bloc.changeSexoCavalo;},
                value: "M",
                groupValue: snapshot.data,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget tipoRegistroCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.tipoRegistroCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return Column(
          children: [
            Text('Tipo de Registro:'),
            Row(
              children: <Widget>[
                ListTile(
                  title: Text('Provisório'),
                  leading: Radio<String>(
                    onChanged: (String? value) {bloc.changeTipoRegistroCavalo;},
                    value: "Provisório",
                    groupValue: snapshot.data,
                  ),
                ),
                ListTile(
                  title: Text('Definitivo'),
                  leading: Radio<String>(
                    onChanged: (String? value) {bloc.changeTipoRegistroCavalo;},
                    value: "Definitivo",
                    groupValue: snapshot.data,
                  ),
                ),
              ],
            ),
          ],
        );        
      }),
    );
  }

  Widget numeroRegistroCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.numeroRegistroCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeNumeroRegistroCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "123456",
            labelText: "Número Registro*",
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

