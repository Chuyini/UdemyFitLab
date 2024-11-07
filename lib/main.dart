import 'package:flutter/material.dart';

void main() {
  runApp(Booksy());
}

class Booksy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Hay restricciones
      padding: EdgeInsets.symmetric(
          horizontal: 40), //<-- solo container recibe este parametro

      child: Center(
        child: Column(
          //Column recibe a fuerzas un childre?

          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 8)],
              ),
              child: Image(
                image: AssetImage(
                    'Images/cover.jpg'), //AssetImage nos permite acceder
                //a recursos del proyecto
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            //Los textos requieren direccionamiento
            Text(
              "The Echo Enigma",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),

            Text(
              "Elena Ferrante",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),

            Text(
              "In a coastal Italian village, archaeologist Lucia Moretti discovers an ancient manuscript that could change history. Pursued by a "
              "secret society, she must unravel the manuscript’s mysteries and uncover her family’s hidden past before it’s too late.",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),

            Directionality(
              //<-- de ley se ocupa para que envuelva al elevatedButton  y darle direccion si no nos marca error
              textDirection: TextDirection.ltr,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Agregar a la libreria "),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
              ),
            )
            //<-- al onPress se le teiene que pasar una funicion vacia, si es null se desactiva
            //Elevated button ademas no tiene una direccion hay que darsela en el child en ese caso un text con ese constructor
          ],
        ),
      ),
      color: Colors.white70,
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
//El container tiene restrriciciones a sus hijos por lo  que
///aveces no dejara darale ciertos atributos
///es como si no te permitiera hacer algo porque ya mando hacer otra cosa de manera global
///y no deja cambiarla

///En el caso de Comtainer no deja darle un widget porque ya ouso uno de manera global
///a todos sus hijos por lo que se necesita un widget mas felxible
///usamos un child
