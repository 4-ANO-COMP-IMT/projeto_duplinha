import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CavaloWidget extends StatelessWidget {
  final String nome;
  final String baia;
  final String pelagem;

  const CavaloWidget({
    required this.nome,
    required this.baia,
    required this.pelagem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.horseHead,
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
          Text("Baia: $baia", style: TextStyle(fontSize: 16)),
          Text("Pelagem: $pelagem", style: TextStyle(fontSize: 16)),
      ],
    )
      ],
    );
  }
}
