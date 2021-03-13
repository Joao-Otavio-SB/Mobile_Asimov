import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: contPessoas()));
}

class contPessoas extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<contPessoas> {
  int _people = 0;
  String _capacity = "Pode Entar!";
  Color textColor = Colors.green;

  void _numberPeople(int n) {
    setState(() {
      _people += n;

      if (_people == 10) {
        _capacity = "Lotado!";
        textColor = Colors.red;
      } else {
        _capacity = "Pode Entrar!";
        textColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "img/restaurant_bg.jpg",
            fit: BoxFit.cover,
            height: 1000,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 150),
                child: Text("Pessoas: $_people",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 40,
                        shadows: [Shadow(offset: Offset(2, 2))])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: TextButton(
                        onPressed: () {
                          if (_people > 0) {
                            _numberPeople(-1);
                          }
                        },
                        child: Text("-1",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 60,
                                shadows: [Shadow(offset: Offset(2.5, 2.5))]))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: TextButton(
                        onPressed: () {
                          if (_people < 10) {
                            _numberPeople(1);
                          }
                        },
                        child: Text("+1",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 60,
                                shadows: [Shadow(offset: Offset(2.5, 2.5))]))),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Text("$_capacity",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(offset: Offset(2, 2))])),
              ),
            ],
          ),
          Positioned(
              bottom: 10,
              right: 15,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Imc()),
                    );
                  },
                  child: Text("IMC ->")))
        ],
      ),
    );
  }
}

class Imc extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Imc> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _Info = "Informe seus dados.";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetField() {
    weightController.text = "";
    heightController.text = "";
  }

  void imcCalc() {
    setState(() {
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);

      double imc = weight / (height * height);

      if (imc < 18.5) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(4)}\nsendo classificado como abaixo do peso";
      } else if (imc >= 18.5 && imc < 25) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(4)}\nsendo classificado como peso normal";
      } else if (imc >= 25 && imc < 30) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(4)}\nsendo classificado como sobrepeso";
      } else if (imc >= 30 && imc < 40) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(4)}\nsendo classificado como obesidade";
      } else if (imc >= 40) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(4)}\nsendo classificado como obesidade grave";
      }
    });
    _resetField();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetField)
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline, size: 120, color: Colors.blue),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura(cm)",
                          labelStyle: TextStyle(color: Colors.blue)),
                      controller: heightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua Altura!";
                        }
                      }),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso(Kg)",
                        labelStyle: TextStyle(color: Colors.blue)),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Peso!";
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              imcCalc();
                            }
                          },
                          child: Text("Calcular",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24))),
                    ),
                  ),
                  Text(
                    "$_Info",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  )
                ],
              )),
        ));
  }
}
