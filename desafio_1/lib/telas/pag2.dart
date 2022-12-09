import 'package:flutter/material.dart';
import 'package:desafio_1/telas/pag1.dart';
import 'package:desafio_1/modelos/variaveis.dart';
import 'dart:math';

class ResponsividadeMediaQuery2 extends StatefulWidget {
  const ResponsividadeMediaQuery2({Key? key}) : super(key: key);

  @override
  _ResponsividadeMediaQueryState2 createState() =>
      _ResponsividadeMediaQueryState2();
}

class _ResponsividadeMediaQueryState2 extends State<ResponsividadeMediaQuery2> {
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;
    Random random = new Random();
    int randomNumber = (random.nextInt(nlados) + 1);
    cor0 = inativo ? Color(0xFFD5D6D9) : Color(0xFFE5007B);

    return Scaffold(
      backgroundColor: DarkMode ? cor1b : cor1,
      body: Column(
        children: [
          Container(
            width: largura,
            height: (17 / 640 * altura),
            color: cor0,
          ),
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'RPG Academy',
                    style: TextStyle(
                        color: cor0,
                        fontSize: (12 / 360 * altura),
                        fontFamily: 'RobotoMono'),
                  ),
                ),
              ),
              Switch(
                value: DarkMode,
                onChanged: (value) {
                  setState(() {
                    DarkMode = value;
                  });
                },
                activeColor: cor0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Role o dado para sortear um valor',
                style: TextStyle(
                    color: DarkMode ? cor1 : cor1b,
                    fontSize: (8 / 360 * altura),
                    fontFamily: 'RobotoMono'),
              ),
            ),
          ),
          Container(
            width: largura - 28,
            height: (380 / 640 * altura),
            color: DarkMode ? cor2b : cor2,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: largura - 28,
                  height: (300 / 640 * altura),
                  color: DarkMode ? cor2b : cor2,
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('img/bg_d$nlados.png'),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          texto,
                          style: TextStyle(
                              color: cor1,
                              fontSize: (70 / 360 * altura),
                              fontFamily: 'RobotoMono'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: largura - 28,
                  height: (80 / 640 * altura),
                  color: DarkMode ? cor2b : cor2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
// Botao Rolar
                      SizedBox(
                        width: 150.0,
                        height: 40.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(cor0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: cor0)))),
                          child: Text('Rolar', style: TextStyle(fontSize: 16)),
                          onPressed: inativo
                              ? null
                              : () {
                                  texto = '$randomNumber';
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ResponsividadeMediaQuery2()),
                                  );
                                  inativo = true;
                                },
                        ),
                      ),
// Botao Cancelar
                      SizedBox(
                        width: 150.0,
                        height: 40.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFE5007B)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  DarkMode ? cor2b : cor2),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color(0xFFE5007B))))),
                          child:
                              Text('Cancelar', style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            texto = '?';
                            inativo = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResponsividadeMediaQuery()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: largura - 28,
            height: (80 / 640 * altura),
            color: DarkMode ? cor1b : cor1,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              DarkMode ? Image.asset('img/01b.png') : Image.asset('img/01.png'),
            ],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResponsividadeMediaQuery2(),
  ));
}
