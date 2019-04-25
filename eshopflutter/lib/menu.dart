import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class PaginaMenu extends StatefulWidget{
  _PaginaMenu createState() => new _PaginaMenu();
}
class _PaginaMenu extends State<PaginaMenu>{
  String url = "http://localhost:3000/db";
  List data;
  Future<String> Recibir() async {
    var response = await http.get (Uri.encodeFull(url), headers: {"Accept": "application/json"} );
    setState(() {
          var extraerData = json.decode(response.body);
          data = extraerData("productos");
        });
  }
  void initState(){
    this.Recibir();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title: Text("ESHOP"),),
      drawer: MenuLateral(),
      body: Center(
        child: new ListView.builder(
          itemCount: data ==null ? 0: data.length,
            itemBuilder: (BuildContext context, i){
              return new Card(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Center( child: CircularProgressIndicator(),),
                        Center(
                          child: Image.network(
                            "http://localhost:3000/db"+data[i]['imagen']
                          ),
                        )
                      ],
                    ),
                     Text(data[i]['nombre'], style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                  ],
                ),
              );
            }
        )
      )
    );
  }
}

class MenuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("                  Bienvenidos a EShop",style: TextStyle(color: Colors.black),),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/eshop.png")),
            ),
          ),
          ListTile(
            title: Text("INICIO"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => new PaginaMenu())
              );
            },
          )
        ],
      ),
    );
  }
}

