import 'package:flutter/material.dart';
import '../components/cartao.dart';
import '../components/cavalo_widget.dart';

class ExibeCavalos extends StatelessWidget {
  // Exemplo de lista de cavalos para testar
  final List<Map<String, String>> listaCavalos = [
    {
      'nome': 'Relâmpago',
      'baia': 'A1',
      'pelagem': 'Castanho'
    },
    {
      'nome': 'Trovão',
      'baia': 'B2',
      'pelagem': 'Branco'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cavalos"),
      ),
      body: ListView.builder(
        itemCount: listaCavalos.length,
        itemBuilder: (context, index) {
          final cavalo = listaCavalos[index];
          return Cartao(
            child: CavaloWidget(
              nome: cavalo['nome']!,
              baia: cavalo['baia']!,
              pelagem: cavalo['pelagem']!,
            ),
            onTap: () {
              // Lógica para ver detalhes do cavalo
              print('Cavalo selecionado: ${cavalo['nome']}');
            },
          );
        },
      ),
    );
  }
}
