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

      if (imc < 18.6) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(3)}\nsendo classificado como abaixo do peso";
      }
      if (imc > 24.8) {
        _Info =
            "Você está com um IMC de: ${imc.toStringAsPrecision(3)}\nsendo classificado como acima do peso";
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
          backgroundColor: Colors.green,
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
                  Icon(Icons.person_outline, size: 120, color: Colors.green),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Altura(cm)",
                          labelStyle: TextStyle(color: Colors.green)),
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
                        labelStyle: TextStyle(color: Colors.green)),
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
                          onPressed: (){
                            if(_formKey.currentState.validate()){
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
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  )
                ],
              )),
        ));
  }
}
