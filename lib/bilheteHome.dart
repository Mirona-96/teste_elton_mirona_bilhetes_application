import 'package:flutter/material.dart';
import 'package:teste_elton_mirona_bilhetes_application/bilhete.dart';
import 'package:teste_elton_mirona_bilhetes_application/bilheteDetalhes.dart';

class BilheteHome extends StatefulWidget {
  const BilheteHome({super.key});

  @override
  State<BilheteHome> createState() => _BilheteHomeState();
}

class _BilheteHomeState extends State<BilheteHome> {
  TextEditingController nomeEventoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  List<Bilhete> Bilhetes = List.empty(growable: true);

  int SelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Lista de Bilhetes')),
        body: Column(
          children: [
            TextField(
              controller: nomeEventoController,
              keyboardType: TextInputType.name,
              maxLength: 20,
              decoration: InputDecoration(
                  hintText: 'Nome do Evento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dataController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                  hintText: 'Data',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 10),
            TextField(
              controller: precoController,
              decoration: InputDecoration(
                  hintText: 'Preco',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: localizacaoController,
              decoration: InputDecoration(
                  hintText: 'Localizacao',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 10),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //botao para adicionar
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    //metodo para gravar os Bilhetes recebendo os dados dos textfield
                    String nomeEvento = nomeEventoController.text
                        .trim()
                        .toUpperCase(); //remove qualquer espaçamento numa string
                    String data = dataController.text.trim();
                    String localizacao = localizacaoController.text.trim();
                    double preco = double.parse(precoController.text.trim());

                    //

                    if (nomeEvento.isNotEmpty &&
                        data.isNotEmpty &&
                        localizacao.isNotEmpty &&
                        preco != null &&
                        preco >= 149) {
                      setState(() {
                        Bilhetes.add(Bilhete(nomeEvento, data, localizacao,
                            double.parse(precoController.text)));
                        //
                        //para limpar os campos apos insercao
                        nomeEventoController.text = '';
                        dataController.text = '';
                        localizacaoController.text = '';
                        precoController.text = '';
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "insira o montante maior ou igual a 149.00 MZN")));
                    }

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesBilhete(Bilhetes:Bilhete(nomeEvento, data, localizacao, preco)))),
                  },
                ),
                //
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //
            Bilhetes.isEmpty
                ? const Text(
                    'Nenhum Bilhete gravado...',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
//                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 0.5,
                      ),
                      itemCount: Bilhetes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BilhetesDetalhes(bilhete: Bilhetes[index]),
                              ),
                            );
                          },
                          child: Container(
                            child: Text(Bilhetes[index].nomeEvento),
                          ),
                        );
                      },
                    ),
                  ),
          ], //para preencher os dados no card com base no data de elementos na lista
          //
        ));
  }
}
