import 'package:flutter/material.dart';
import 'package:atividade/pages/grid_atv.dart';
import 'package:atividade/pages/form_atv.dart';
import 'package:atividade/pages/imc_atv.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator( 
        onGenerateRoute: (settings) { 
          return MaterialPageRoute(builder: (context) => const HomePage());
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Grid'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridAtv()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Form'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormAtv()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('IMC'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IMCAtv(title: 'Calculadora IMC')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
