import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Stack(
      children: [
        Image.asset(
          "img/restaurant_bg.jpg",
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: 3",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40)
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40)
                    )
                  ),
                )
                ],
              ),
              Text(
                "Pode Entrar!",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              )
          ],
        )
      ],
    )
  ));
}