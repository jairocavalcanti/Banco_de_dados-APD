import 'package:apd/rootpage.dart';
import 'package:apd/screens/messages/message_screen.dart';
import 'package:apd/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apd/screens/chats/chats_screen.dart';

construirPagina({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
}) =>
    Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 25, // Titulo
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24), // O padrão é 24
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black26,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final controle = PageController();
  bool ultimaPagina = false;

  @override
  void dispose() {
    controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controle,
          onPageChanged: (index) {
            setState(() => ultimaPagina = index == 2);
          },
          children: [
            construirPagina(
                color: Colors.green.shade100,
                urlImage: 'assets/transition/page1.png',
                title: 'O que oferecemos?',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
            construirPagina(
                color: Colors.blue.shade100,
                urlImage: 'assets/transition/page2.png',
                title: 'Qual o diferencial?',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
            construirPagina(
                color: Colors.green.shade100,
                urlImage: 'assets/transition/page3.png',
                title: 'Nosso objetivo',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
          ],
        ),
      ),
      bottomSheet: ultimaPagina
          ? TextButton(
              style: TextButton.styleFrom(
                  // ignore: prefer_const_constructors
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(10),
                      ),
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80)),
              child: const Text(
                'Começar',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () async {
                // navegar diretamente p/tela principal
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('mostraTelaPrincipal', true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const RootPage()));
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Pular'),
                    onPressed: () => controle.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controle,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controle.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text('Avançar'),
                    onPressed: () => controle.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ));
}
