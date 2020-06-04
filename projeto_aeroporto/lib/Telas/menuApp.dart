import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Listas/listaCruzeiros.dart';
import 'package:projeto_aeroporto/Listas/listaOnibus.dart';
import 'package:projeto_aeroporto/Listas/listaPassagens.dart';
import 'package:projeto_aeroporto/Listas/listaVoos.dart';
import 'package:projeto_aeroporto/Telas/telaInicial.dart';
import 'package:projeto_aeroporto/Widgets/widgetSelecione.dart';
import 'package:projeto_aeroporto/main.dart';

class MenuApp extends StatefulWidget {
const MenuApp({
   this.idCliente,
});

  final int idCliente;
  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

Widget lista = Selecione(texto: "Selecione uma das opções no menu acima.", 
                          icone: (Icons.expand_less));

verificaPassagens(){
  if(listaPassagensUsuario.length == 0){
    return alertInformativo(context, 
                            "Você ainda não comprou nenhuma passagem :/", 
                            "",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }
  else{
    return lista = ListaPassagens();
  }
}

@override Widget build(BuildContext context) {

    listaPassagensUsuario = listaTodasPassagens.where((element) => element.idPassageiro == widget.idCliente).toList();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Menu"),
            centerTitle: true,
            actions: [
              IconButton(icon: Icon(Icons.exit_to_app), 
                         onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()
                                                                               )
                                                    );
                         }
              ),
            ],
          ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            new SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                          child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,      
        children: <Widget>[
        SizedBox(
          height: 40,
          width: 120,
                  child: RaisedButton.icon(
                     onPressed: () {setState(() {
                       lista = ListaVoos(idCliente: widget.idCliente);
                     });}, 
                     icon: Icon(Icons.flight_takeoff, size: 30), 
                     label:Text('Vôos', textScaleFactor: 0.75,),
                     shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                     ),
                     color: Colors.lightBlue[300],
                     ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          height: 40,
          width: 120,
                  child: RaisedButton.icon(
                     onPressed: () {setState(() {
                       lista = ListaOnibus(idCliente: widget.idCliente,);
                     });},
                     icon: Icon(Icons.directions_bus, size: 30), 
                     label:Text('Ônibus', textScaleFactor: 0.75,),
                     shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                     ),
                     color: Colors.lightBlue[300],
                     ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          height: 40,
          width: 120,
                  child: RaisedButton.icon(
                     onPressed: () {setState(() {
                       lista = ListaCruzeiros(idCliente: widget.idCliente,);
                     });},
                     icon: Icon(Icons.directions_boat, size: 30), 
                     label:Text('Cruzeiros', textScaleFactor: 0.75,),
                     shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                     ),
                     color: Colors.lightBlue[300],
                     ),
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          height: 40,
          width: 120,
                  child: RaisedButton.icon(
                     onPressed: (){setState(() {
                       verificaPassagens();
                     });},
                     icon: Icon(Icons.style, size: 30), 
                     label:Text('Minhas\nPassagens', textScaleFactor: 0.75,),
                     shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                     ),
                     color: Colors.lightBlue[300],
          ),
        ),
        SizedBox(width: 5),
       ],
                ),
            ),
            SizedBox(height: 10),
            lista,
          ],
        ),
    )));
  }
}


  