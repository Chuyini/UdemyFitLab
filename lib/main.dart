import 'package:flutter/material.dart';

void main() {
  runApp(Booksy());
}

class Booksy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Hay restricciones

      child: Center(
        child: Column(
          //Column recibe a fuerzas un childre?
          children: [
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
            //Los textos requieren direccionamiento
            Text(
              "Titulo",
              textDirection: TextDirection.ltr,
            ),
            Text("Author", textDirection: TextDirection.ltr),
            Text("", textDirection: TextDirection.ltr)
          ],
        ),
      ),
      color: Colors.blueGrey,
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
