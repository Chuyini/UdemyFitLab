import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: KeysApp(),
  ));
}

class KeysApp extends StatefulWidget {
  const KeysApp({Key? key}) : super(key: key);

  @override
  State<KeysApp> createState() => _KeysAppState();
}

class _KeysAppState extends State<KeysApp> {
  static Color rojo = Color.fromARGB(100, 200, 0, 0);
  static Color verde = Color.fromARGB(100, 200, 0, 0);

  var celdas = [
    ColorCelda(
      color: rojo,
      label: "Rojo",
      key: ObjectKey(rojo),
    ),
    ColorCelda(
      color: verde,
      label: "Verde",
      key: ObjectKey(verde),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo de Keys"),
      ),
      body: Center(
        child: Column(
          children: celdas,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapColors,
        child: const Icon(Icons.update_rounded),
      ),
    );
  }

  _swapColors() {
    setState(() {
      var temp = celdas[0];
      celdas[0] = celdas[1];
      celdas[1] = temp;
    });
  }
}

class ColorCelda extends StatefulWidget {
  final Color color;
  final String label;

  const ColorCelda({
    required this.color,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  _ColorCeldaState createState() => _ColorCeldaState();
}

class _ColorCeldaState extends State<ColorCelda> {
  late Color color;
  late String label;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    label = widget.label;
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(label),
        ),
      );
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
