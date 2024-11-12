import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Booksy",
            ),
          ),
        ),
        body: Profile(),
      ),
    ),
  );
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              child: Image(
                image: AssetImage("Images/back.jpg"),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage("Images/gato.jpeg"),
              radius: 40.0,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: const Text(
            "mas corto Caminando por el bosque, Ana encontró una llave dorada enterrada bajo un árbol. Emocionada, decidió seguir buscando pistas. Su aventura apenas comenzaba. 🌳🔑🚶‍♀️",
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 70.0,
              ),
              Expanded(
                //<-- fuerza a los hijos a dibujarse dentro del display
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Libro leidos"),
                    const Text(
                      "Numero de libros que este usuario ha finalizado",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Text(
                "104",
                style: TextStyle(
                  fontSize: 20.00,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          //<-- una celda en una lista
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          title: Text(
            "Lista de libros deseados",
          ),
          subtitle: Text("Numero de libros en la lista de deseos"),
          leading: Icon(
            Icons.book,
            size: 50,
          ),
          trailing: Text(
            "234",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Text(
          "Redes Sociales",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.00,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.00),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ac_unit),
              iconSize: 50.0,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.accessible_forward_outlined),
              iconSize: 50.0,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.adb_outlined),
              iconSize: 50.0,
            ),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Agregar Amigo"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Enviar mensaje"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}

///Los buldscontext saben sobre su padre
///
/// que son las Keys
///
///Sirven para que flutter pueda comparar Widgets cuando tenga que hacer un rebuild
///
/// Por defecto,flutter compara el runtimType(Tipo)del widget, pero si existe una key, compara el runtipe y la key

///Todo Global Keys y LocalKeys
///
/// Las Globalkeys son llaves unicas para toda la App
/// Las Local Keys <-- tienen que ser unicas entre hermanos, es decir unicas para todos los ELEMENTS con el mismo padre
///   Los tipos son :
///     valueKeys
///     ObjectKeys
///     UniqueKeys
///
///     puedes usar
///     key:const ValueKey("Verde") <-- delega igualdad en los tipos. Y será basandose en lo que tu pongas
///                                     debes de cuidar no poner misma key porqye te saldra "Duplicate Key found" entre hermanos
///     var Verde = const Color.from(100,0,0);
///     var Rojo = const Color.from(0,100,0);
///         Cuando tienen const asegurarse de que no tengan mismo valores
///         pero sin const no importa
///     key:ObjectKey("Verde");
///     key:ObjectKey("Rojo");
///

///Layouts, sirven para almacenar un hijo o  varios
