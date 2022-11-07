import 'package:flutter/material.dart';


class Avaliacao extends StatefulWidget {
  const Avaliacao({super.key});

  @override
  State<Avaliacao> createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação completa'),
        //Deleta a seta padrão
        automaticallyImplyLeading: false,
        //Adiciona outro botão pra retornar
        leading: IconButton(
            onPressed: () {
              //Deleta a pagina e retornar
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
    );
  }
}
