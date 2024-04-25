import 'package:flutter/material.dart';
import 'package:teste_elton_mirona_bilhetes_application/bilhete.dart';

class BilhetesDetalhes extends StatelessWidget {
  final Bilhete bilhete;

  const BilhetesDetalhes({Key? key, required this.bilhete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Bilhete'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detalhes do Bilhete',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            Text('Nome do Evento: ${bilhete.nomeEvento}'),
            Text('Data do Evento: ${bilhete.data}'),
            Text('Preçario do Evento: ${bilhete.preco} MT'),
            Text('Localizacao: ${bilhete.localizacao}'),
          ],
        ),
      ),
    );
  }
}
