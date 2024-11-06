import 'package:flutter/material.dart';
/*import 'dart:io';
import 'dart:developer';*/
//BreakPointys
//Sirven modo debug

//se detienen en eos puntos

//Hot reload = Funciona cuando los cambios se hacen adentro del build
//Actualiza la UI en la jerarquía de Widgets
//Mantiene el estado de la App

//Hot restart = reiniciar
//Es un reinicio desde 0
//Reinicia el Estado de la App
void main() {
  print("App iniciada");
  //stdout.write("Hola desde stdout");//<-- este sirve para debugear y se puede ver en el inspetor devtools
  /*log("Debueado", name: "Algo");//<-- este tambien sirve para debugear
  stdout.write("Error porque si");*/

  runApp(MyApp());
}

//Agregar el Trailing comma, que es las commas al final para que se formaté el codigo de manera automática
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    var text = "Hola Flutter";
    return Center(
      child: Text(text, textDirection: TextDirection.ltr),
    );
  }
}
//Los widgers son inmutables
