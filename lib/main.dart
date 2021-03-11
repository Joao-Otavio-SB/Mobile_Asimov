import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: contPessoas()
  ));
}

class contPessoas extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<contPessoas>{

  int _people = 0;
  String _capacity = "Pode Entar!";
  Color textColor = Colors.white;

  void _numberPeople(int n){
    setState(() {
      _people += n;

      if(_people == 10){
      _capacity = "Lotado!";
      textColor = Colors.red;
     }else{
      _capacity = "Pode Entrar!";
      textColor = Colors.green;
      }
    });

  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Image.asset(
          "img/restaurant_bg.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){
                      if(_people > 0){
                        _numberPeople(-1);
                      }
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){
                      if(_people < 10){
                        _numberPeople(1);
                      }
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40)
                    )
                  ),
                )
                ],
              ),
              Text(
                "$_capacity",
                style: TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
              )
          ],
        )
      ],
    );
  }
}