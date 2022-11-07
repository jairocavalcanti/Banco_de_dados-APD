import 'package:flutter/material.dart';

import '../questions/avaliacao.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Avaliacao();
                },
              ),
            );
          },
          child: const Text('Avaliação completa')),
    );
  }
}
