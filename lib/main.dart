import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //<-- Si fuera IOS tendriamos que usar MaterialCupertino
    //si hacemos cambios fuera del build ocupamos un Hot reload
    home: Scaffold(
      appBar: AppBar(
        title: Text("SomeApp"),
      ),
      body: SomeScreen(),
    ),
    title: "Some App",
  ));
}

class SomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //Theme.of(context);
    //Scaffold.of(context);
    //Provider of
    return Column(
      children: [
        Container(
          child: Text("Hola Flutter"),
        ),
        SomeOtherScreen(),
        ElevatedButton(
          onPressed: () {
            Scaffold.of(context).showBottomSheet(
              (context) => Container(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text("Algo"),
                ),
                padding: EdgeInsets.all(30.0),
                color: Colors.green,
                width: double.infinity,
              ),
            ); //agarra este context y busca su Scaffold mas cercano o proximo hacia arriba en el arbol
            //Y agrega este bottomShet con este container y sus propiedades
            ///Cuidado con donde llamamos Scaffold dado que puede que ni siquiera se haya creado en el context
            ///o no se ha creado o no es padre
            ///Podemos usar el builder en el caso de que el scaffold haya quedado corto para agregar un nivel mas
            ///y se pueda reconocer el scaffold
            ///
            /// body: Builder(builder:(nuevoContextoActualizado){
            ///return ElevatedButton(
            ///Onpress:(){
            ///Scaffold.of(nuevoContextoActualizado).haceralgo
            ///}
            ///);
            ///
            ///}
            ///
          },
          child: Text("Presioname"),
        ),
      ],
    );
  }
}

class SomeOtherScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SomeOtherScreenState();
  }
}

class _SomeOtherScreenState extends State<SomeOtherScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(textDirection: TextDirection., child: child);
  }
}

///Los buldscontext saben sobre su padre
