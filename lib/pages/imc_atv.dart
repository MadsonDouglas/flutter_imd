import 'package:flutter/material.dart';
import 'dart:math';

class IMCAtv extends StatefulWidget {
  const IMCAtv({super.key, required this.title});
  final String title;

  @override
  State<IMCAtv> createState() => _IMCAtv();
}

class IMCResultWidget extends StatelessWidget {
  final double imc;

  const IMCResultWidget({super.key, required this.imc});

  String _getIMCDescription(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesidade Grau II';
    } else {
      return 'Obesidade Mórbida';
    }
  }

  AssetImage _getIMCImage(double imc) {
    if (imc < 18.5) {
      return const AssetImage('assets/abaixo.png');
    } else if (imc < 25) {
      return const AssetImage('assets/normal.png');
    } else if (imc < 30) {
      return const AssetImage('assets/sobrepeso.png');
    } else if (imc < 35) {
      return const AssetImage('assets/obesoI.png');
    } else if (imc < 40) {
      return const AssetImage('assets/obesoII.png');
    } else {
      return const AssetImage('assets/morbido.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = _getIMCDescription(imc);
    AssetImage image = _getIMCImage(imc);

    if (imc == 0) {
      return Container();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            'IMC: ${imc.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Image(
          image: image,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(
              description,
              style: const TextStyle(fontSize: 16),
            )),
      ],
    );
  }
}

class _IMCAtv extends State<IMCAtv> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _height = 0;
  double _weight = 0;
  double _imc = 0;

  void _reset() {
    setState(() {
      _heightController.clear();
      _weightController.clear();
      _height = 0;
      _weight = 0;
      _imc = 0;
    });
  }

  double _calculateBMI(double height, double weight) {
    if (weight == 0 || height == 0) {
      return 0;
    }
    return weight / pow(height / 100, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp(
          title: 'IMCAtv',
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black54,
                title: Text(widget.title,
                    style: const TextStyle(color: Colors.white)),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {Navigator.pop(context);},
                ),
                actions: [
                  IconButton(
                    icon:
                        const Icon(Icons.more_vert_sharp, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              body: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Entre com sua altura (cm)',
                          prefixIcon:
                              Icon(Icons.design_services), 
                        ),
                        onChanged: (value) {
                          setState(() {
                            _height = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Entre com seu peso (kg)',
                          prefixIcon: Icon(
                              Icons.accessibility), 
                        ),
                        onChanged: (value) {
                          setState(() {
                            _weight = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _imc = _calculateBMI(_height, _weight);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Calcular',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: _reset,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Resetar',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 40),
                        child: IMCResultWidget(imc: _imc),
                      )
                    ],
                  ),
                ),
              ])),
        ));
  }
}
