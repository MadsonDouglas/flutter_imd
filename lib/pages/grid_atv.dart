import 'package:flutter/material.dart';

class GridAtv extends StatelessWidget {
  const GridAtv({super.key});

  static EdgeInsets? safeAreaPadding;

  @override
  Widget build(BuildContext context) {
    final List<List<Color>> cores = [
      [Colors.red, Colors.red, Colors.red, Colors.green],
      [Colors.red, Colors.red, Colors.blue, Colors.yellow],
      [Colors.red, Colors.green, Colors.yellow, Colors.yellow],
      [Colors.blue, Colors.yellow, Colors.yellow, Colors.yellow],
      [Colors.green, Colors.green, Colors.red, Colors.yellow],
      [Colors.green, Colors.green, Colors.green, Colors.blue],
    ];

    safeAreaPadding ??= MediaQuery.of(context).padding;

    double screenHeight = MediaQuery.of(context).size.height -
        (safeAreaPadding!.top + safeAreaPadding!.bottom);
    double screenWidth = MediaQuery.of(context).size.width;

    double height = screenHeight / 6;
    double width = screenWidth / 4;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemCount: cores.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                for (int j = 0; j < cores[index].length; j++)
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height,
                    color: cores[index][j],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}