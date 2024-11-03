import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import '../../routes.dart';

class CadastraCavalo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Cavalo'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            bloc.clean();
            Navigator.pushNamed(context, AppRoutes.exibeCavalos);
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
        nomeCavaloField(bloc),
        SizedBox(height: 20,),
        racaCavaloField(bloc),
        SizedBox(height: 20,),
        dtNascCavaloField(bloc),
        SizedBox(height: 20,),
        pelagemCavaloField(bloc),
        SizedBox(height: 30,),
        castradoCavaloField(bloc),
        SizedBox(height: 20,),
        sexoCavaloField(bloc),
        SizedBox(height: 20,),
        tipoRegistroCavaloField(bloc),
        SizedBox(height: 20,),
        numeroRegistroCavaloField(bloc),
        SizedBox(height: 20,),
        chipCavaloField(bloc),
        SizedBox(height: 20,),
        baiaCavaloField(bloc),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sexo*'),
            SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeSexoCavalo(value!);},
                      value: "F",
                      groupValue: snapshot.data,
                    ),
                    Text('Fêmea'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeSexoCavalo(value!);},
                      value: "M",
                      groupValue: snapshot.data,
                    ),
                    Text('Macho'),
                  ],
                ),
              ],
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo de Registro'),
            SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeTipoRegistroCavalo(value!);},
                      value: "Provisório",
                      groupValue: snapshot.data,
                    ),
                    Text('Provisório'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeTipoRegistroCavalo(value!);},
                      value: "Definitivo",
                      groupValue: snapshot.data,
                    ),
                    Text('Definitivo'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      onChanged: (value) {bloc.changeTipoRegistroCavalo(value!);},
                      value: "",
                      groupValue: snapshot.data,
                    ),
                    Text('Sem registro'),
                  ],
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
            labelText: "Número Registro",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget chipCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.chipCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeChipCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "123456789012345",
            labelText: "Número do Chip",
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }),
    );
  }

  Widget baiaCavaloField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.baiaCavalo,
      builder: ((context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeBaiaCavalo,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Ex.: 7A",
            labelText: "Baia",
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
          onPressed: () => {!snapshot.hasData ? null : snapshot.requireData ? bloc.submitCavaloForm(context) : null,
          },
          child: Text('Cadastrar')
        );
      },
    );
  }
}

