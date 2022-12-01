import 'package:flutter/material.dart';
import 'package:desafio_1/variables.dart';
import 'package:desafio_1/modelos/dado.dart';
import 'package:desafio_1/modelos/lista_dados.dart' as lista_dados;

class ResponsividadeMediaQuery extends StatefulWidget {
  const ResponsividadeMediaQuery({Key? key}) : super(key: key);

  @override
  _ResponsividadeMediaQueryState createState() =>
      _ResponsividadeMediaQueryState();
}

class _ResponsividadeMediaQueryState extends State<ResponsividadeMediaQuery> {
  final dados = List<Dado>.from(lista_dados.smallListaDados);

  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;
    final altura = MediaQuery.of(context).size.height;

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
                onChanged: (onChanged) {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selecione  um dado para ser lançado',
                style: TextStyle(
                    color: DarkMode ? cor1 : cor1b,
                    fontSize: (8 / 360 * altura),
                    fontFamily: 'RobotoMono'),
              ),
            ),
          ),

          Expanded(
              child: ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  final dado = dados[index];
                  return Card(
                    color: DarkMode ? cor2b : cor2,
                    child: ListTile(
                        textColor: DarkMode ? cor1 : cor1b,
                        title: Text(dado.nome),
                        leading: Image.asset(dado.imagem),
                      ),
                  );
                },
            
          )
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ResponsividadeMediaQuery(),
  ));
}
