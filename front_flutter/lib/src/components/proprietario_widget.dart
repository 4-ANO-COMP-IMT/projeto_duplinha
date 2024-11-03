import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProprietarioWidget extends StatelessWidget {
  final String nome;
  final String telefone;
  final String email;

  const ProprietarioWidget({
    required this.nome,
    required this.telefone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.solidUser,
          size: 50,
        ),
        SizedBox(
          width: 30,
        ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Telefone: $telefone", style: TextStyle(fontSize: 16)),
          Text("E-mail: $email", style: TextStyle(fontSize: 16)),
      ],
    )
      ],
    );
  }
}
