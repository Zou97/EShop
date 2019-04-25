import 'package:flutter/material.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaInicio(),
      initialRoute: "/",
      routes: {
        '/menu': (context) =>PaginaMenu(),
      },
    );
  }
}

class PaginaInicio extends StatefulWidget{
  _PaginaInicio createState() => new _PaginaInicio();
}
class _PaginaInicio extends State<PaginaInicio>{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/img/eshop.png"),
            Text("TU TIENDA ELECTRONICA", style: TextStyle(color: Colors.grey),),
            RaisedButton(
              child: Text("ACCEDER"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  )
                ), 
                onPressed: (){
                Navigator.pushNamed(context, "/menu");
                },
              )
          ],
        ),
      )
    );
  }
}