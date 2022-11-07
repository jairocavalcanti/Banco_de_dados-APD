import 'package:apd/screens/homePage/home_page.dart';
import 'package:apd/screens/transition/transicao.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //Contando paginas
  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Debug APD"),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                // Retonar para a tela de transição
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('mostrarTelaPrincipal', false);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => onBoarding()),
                );
              }),
        ],
      ),
      body: const HomePage(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.message), label: "Mensagem"),
          NavigationDestination(
              icon: Icon(Icons.polyline_outlined), label: "Forum"),
          NavigationDestination(icon: Icon(Icons.person), label: "Perfil"),
          //NavigationDestination(icon: Icon(Icons.person), label: "Perfil") incluir icone meditação
        ],
        onDestinationSelected: (int index) {
          setState(() {
            paginaAtual = index;
          });
        },
        selectedIndex: paginaAtual,
      ),
    );
  }
}
