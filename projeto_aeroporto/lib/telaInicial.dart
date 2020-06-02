import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/classes.dart';
import  'package:projeto_aeroporto/listas.dart'; 

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

Widget lista = ListaVoos();

class _TelaInicialState extends State<TelaInicial> {

@override Widget build(BuildContext context) {
     listaVoos.clear();
     listaOnibus.clear();
     listaCruzeiros.clear();

    //Adicionar itens na Lista
    listaVoos.add(Voo((Icons.flight_takeoff), 1, "Ribeirão Preto", "São Paulo", "1.250,00", "27/05/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 2, "Ribeirão Preto", "João Pessoa", "1.350,00", "27/05/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 3, "Ribeirão Preto", "Campinas", "830,99", "27/05/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 4, "Ribeirão Preto", "Porto Alegre", "1.100,50", "27/05/2020"));

    listaOnibus.add(Onibus((Icons.directions_bus), 5, "Ribeirão Preto", "São Paulo", "100,00", "27/05/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 6, "Ribeirão Preto", "Santos", "115,00", "27/05/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 7, "Ribeirão Preto", "Uberlândia", "60,00", "27/05/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 8, "Ribeirão Preto", "Miguelópolis", "45,50", "27/05/2020"));

    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 9, "Santos", "Buenos Aires", "2.000,00", "27/05/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 10, "Rio de Janeiro", "Santos", "3.250,00", "27/05/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 11, "Espiríto Santo", "Fernando de Norona", "1.860,00", "27/05/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 12, "Praia Grande", "Cancun", "2.750,50", "27/05/2020"));
        
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Tela Inicial"),
            centerTitle: true,
          ),
      body: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 4,
                child: RaisedButton.icon(
                       onPressed: () {setState(() {
                         lista = ListaVoos();
                       });}, 
                       icon: Icon(Icons.flight_takeoff, size: 15), 
                       label:Text('Vôos', textScaleFactor: 0.75,)
                       )
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 4,
                child: RaisedButton.icon(
                       onPressed: () {setState(() {
                         lista = ListaOnibus();
                       });},
                       icon: Icon(Icons.directions_bus, size: 15), 
                       label:Text('Ônibus', textScaleFactor: 0.75,),
                       )
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 4,
                child: RaisedButton.icon(
                       onPressed: () {setState(() {
                         lista = ListaCruzeiros();
                       });},
                       icon: Icon(Icons.directions_boat, size: 15), 
                       label:Text('Cruzeiros', textScaleFactor: 0.75,)
                       )
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          lista,
        ],
      ),
    )));
  }
}


  