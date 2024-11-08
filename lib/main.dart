import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //<-- Si fuera IOS tendriamos que usar MaterialCupertino
    //si hacemos cambios fuera del build ocupamos un Hot reload
    home: Booksy(),
    title: "Booksy",
  ));
}
//IOS no tiene AppBarr, si no que tiene un navegationBar

class UserData extends InheritedWidget {
  final List<String> booksIDs;

  const UserData({Key? key, required this.booksIDs, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    ///Esta funcio responde hace la siguiente pregunta por eso retorna un bool
    // TODO: Debo notificar a mis hijos para que se actualicen ?
    //
    return true;
  }
}

class Booksy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var booksId = ["Chopin", "Goulgas"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booksy",
        ),
      ), //<-- Barra de arriba
      body: UserData(
        booksIDs: booksId,
        child: Container(
          //Hay restricciones
          padding: EdgeInsets.symmetric(
              horizontal: 40), //<-- solo container recibe este parametro
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                //<--agregamos el single scroll view en la columna
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
                    BookDescription(
                      "The Echo Enigma",
                      "Elena Ferrante",
                      "In a coastal Italian village, archaeologist Lucia Moretti discovers an ancient manuscript that could change history. Pursued by a "
                          "secret society, she must unravel the manuscript’s mysteries and uncover her family’s hidden past before it’s too late.",
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          color: Colors.white70,
        ),
      ),
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
///

//Todo: Hacer un widget Propio
class BookDescription extends StatelessWidget {
  //Recordemos que es un constructor lo que necesitamos para poder pasarle parametros
  //dado que es una clase

  late final String
      description; //<-- late indica que se inicializara antes de de su uso y final que solo una vez
  //A diferencia de const que no te permitehacer eso, ya que se tiene que inicializar antes de ejecutar
  late final String title;
  late final String author;

  BookDescription(this.author, this.title, this.description);

  ///<-- CONSTRUCTOR

  @override
  Widget build(BuildContext context) {
    ///De ley se tiene que implementar metodo ya que tiene ser abstracto
    ///
    return Column(
      children: [
        //Los textos requieren direccionamiento
        Text(
          this.author,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),

        Text(
          this.title,
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
          this.description,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        AddButtonBook(),
      ],
    );
  }
}

class AddButtonBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    ///Esta clase padre hace uso de otra logica, al ser un Widgetde estado
    ///Tenemos que crear un estado para que pueda ser aplicado
    ///La regla es el nombre del Widget pero con un _ al principio
    return _AddButtonBook();

    ///<-- Aqui implementamos el Widget de estado
  }
}

class _AddButtonBook extends State<AddButtonBook> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var button = _isSaved
        ? ElevatedButton(
            onPressed: _manageBookLibrary,
            child: Text("Quitar de la libreria"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
          )
        : ElevatedButton(
            onPressed: _manageBookLibrary,
            child: Text("Agregar a la libreria"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
          );

    return Directionality(
      //<-- de ley se ocupa para que envuelva al elevatedButton  y darle direccion si no nos marca error
      textDirection: TextDirection.ltr,
      child: button,
    );
    //<-- al onPress se le tiene que pasar una funicion vacia, si es null se desactiva
    //Elevated button ademas no tiene una direccion hay que darsela en el child en ese caso un text con ese constructor
  }

  //creamos una funcion afuera del metodo build pero es parte de la clase
  void _manageBookLibrary() {
    //Actualizar el backend y actualizar la BD
    setState(() {
      //necesario para que cambie
      //esta funcion necesitra otra funcion, es para decirle a flutter, que vuelva a cargar esta parte
      this._isSaved = !this._isSaved;
    });

    ///De hecho no es necesario meter lo que cambiamos, con llamar a setState es mas que sifiente
    ///ya que se vuelve a llamar el build
    ///Pero por convencion se pone adentro para que qued
  }
}

//todo: Material y Cupertino

///Material--> para androi
///Cuppertino--> Para ios, que es donde estan las instalaciones de IOS

//Estas bibliotecas proveen un desarrollo estandar, como por ejemplo mandar los widgets a la zona segura
