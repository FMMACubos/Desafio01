import 'package:desafio_1/telas/pag2.dart';
import 'package:flutter/material.dart';
import 'package:desafio_1/telas/pag1.dart';

final pageController = PageController();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PageView(
      controller: pageController,
      children: [
        ResponsividadeMediaQuery(),
        ResponsividadeMediaQuery2(),
      ],
    ),
  ));
}
