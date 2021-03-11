import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Imc(),
  ));
}

class Imc extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Imc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outline, size: 120, color: Colors.green),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso(Kg)",
                      labelStyle: TextStyle(color: Colors.green))),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura(cm)",
                      labelStyle: TextStyle(color: Colors.green))),
              Container(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
              ),
              Text(
                "Insira seus dados",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
