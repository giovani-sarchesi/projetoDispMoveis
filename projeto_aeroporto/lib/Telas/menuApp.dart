import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/Telas/telaInicial.dart';
import 'package:projeto_aeroporto/main.dart';

class MenuApp extends StatefulWidget {
const MenuApp({
   this.idCliente,
});

  final String idCliente;
  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

var db = Firestore.instance;
final String colecao = "Viagens";
final String passagens = "Passagens";
StreamSubscription<QuerySnapshot> listen;
Widget lista;
var indicador = "Todas";
var iconeSelecionado = Icons.card_travel;
bool tipoFiltro = true;

realizarFiltroViagens(String filtroOrigem, String filtroDestino, String tipoViagem){
   int tipoFiltro;
   if(filtroOrigem.isEmpty && filtroDestino.isEmpty){
    return alertInformativo(context, 
                      "Impossível filtrar.", 
                      "Pelo menos um dos filtros devem ser informados.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
   }
   
   if(filtroOrigem.isNotEmpty && filtroDestino.isEmpty){
     tipoFiltro = 1;
   }
   else if(filtroOrigem.isEmpty && filtroDestino.isNotEmpty){
     tipoFiltro = 2;
   }
   else{
     tipoFiltro = 3;
   }

   if(tipoViagem != "Todas"){
      switch(tipoFiltro){
        case 1:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.tipoViagem == tipoViagem)
                           .where((element) => element.origem.toUpperCase().contains(filtroOrigem.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
          break;

        case 2:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.tipoViagem == tipoViagem)
                           .where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
          break;
        
        case 3:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.tipoViagem == tipoViagem)
                           .where((element) => element.origem.toUpperCase().contains(filtroOrigem.toUpperCase()))
                           .where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
      }
    }
    else{
     switch(tipoFiltro){
        case 1:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.origem.toUpperCase().contains(filtroOrigem.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
          break;

        case 2:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
          break;
        
        case 3:
          listen = db.collection(colecao).snapshots().listen((res) { 
            setState((){
            listaSelecionada = res.documents.
                           map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                           .where((element) => element.origem.toUpperCase().contains(filtroOrigem.toUpperCase()))
                           .where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase()))
                           .where((element) => element.qtdePassagem > 0)
                           .toList();
            });
          });
      }
    }
}

trocaLista(String tipoViagem){
  if(tipoViagem == "Todas"){
  listen = db.collection(colecao).snapshots().listen((res) { 
                          setState((){
                            listaSelecionada = res.documents.
                                               map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                                               .where((element) => element.qtdePassagem > 0)
                                               .toList();
                          });
                        });
  }
  else{
  listen = db.collection(colecao).snapshots().listen((res) { 
                          setState((){
                          listaSelecionada = res.documents.
                             map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                             .where((element) => element.tipoViagem == indicador)
                             .where((element) => element.qtdePassagem > 0)
                             .toList();
                          });
                        });
  }
}

iconeTipo(String tipo){
    switch (tipo) {
      case "Voo":
        return Icons.flight_takeoff;
        break;
      case "Onibus":
        return Icons.directions_bus;
        break;
      case "Cruzeiro":
        return Icons.directions_boat;
        break;
      }
    }

qtdeDisponivel(int qtde){
      if(qtde <= 10){
        return Colors.red;
      }
      if(qtde <= 25){
        return Colors.yellow[600];
      }
      else{
        return Colors.green;
      }
    }

padroesStatus(String status){
    if(status == "Pagamento confirmado"){
      return Colors.green;
    }
    else{
      return Colors.red;
    }
}

@override void initState(){
  super.initState();
  listen?.cancel();

  listen = db.collection(colecao).snapshots().listen((res) { 
    setState((){
      listaSelecionada = res.documents.
                         map((doc) => Viagens.fromMap(doc.data, doc.documentID))
                         .where((element) => element.qtdePassagem > 0)
                         .toList();
    });
  });

  listen = db.collection(passagens).snapshots().listen((res) { 
                          setState((){
                          listaPassagensUsuario = res.documents.
                             map((doc) => Passagem.fromMap(doc.data, doc.documentID))
                             .where((element) => element.idCliente == widget.idCliente)
                             .toList();
                    
    });
  });
}

 @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }


@override Widget build(BuildContext context) {
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    TextEditingController txtOrigem = TextEditingController();
    TextEditingController txtDestino = TextEditingController();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Menu"),
          leading: IconButton(
            icon: Icon(Icons.style),
            onPressed: (){
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
            centerTitle: true,
            actions: [
              IconButton(icon: Icon(Icons.exit_to_app), 
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaInicial()));
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
                SizedBox(height: 40, width: 120,
                  child: RaisedButton.icon(
                  onPressed: () {setState(() {
                    indicador = "Todas";
                    iconeSelecionado = Icons.card_travel;
                    trocaLista(indicador);
                  });}, 
                  icon: Icon(Icons.card_travel, 
                             size: 30), 
                  label:Text('Todas', 
                             textScaleFactor: 0.75),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(1000.0),
                  ),
                  color: Colors.lightBlue[300],
                ),
               ),
               SizedBox(width: 5),
               SizedBox(height: 40, width: 120,
                  child: RaisedButton.icon(
                  onPressed: () {setState(() {
                    indicador = "Voo";
                    iconeSelecionado = Icons.flight_takeoff;
                    trocaLista(indicador);
                    });
                  }, 
                  icon: Icon(Icons.flight_takeoff, 
                             size: 30), 
                  label:Text('Vôos', 
                             textScaleFactor: 0.75,
                            ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(1000.0),
                  ),
                  color: Colors.lightBlue[300],
                ),
               ),
               SizedBox(width: 5),
               SizedBox(height: 40, width: 120,
                  child: RaisedButton.icon(
                  onPressed: () {setState(() {
                    indicador = "Onibus";
                    iconeSelecionado = Icons.directions_bus;
                    trocaLista(indicador);
                    });
                  },
                  icon: Icon(Icons.directions_bus, 
                             size: 30,), 
                  label:Text('Ônibus', 
                             textScaleFactor: 0.75,
                            ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(1000.0),
                  ),
                  color: Colors.lightBlue[300],
                  ),
               ),
               SizedBox(width: 5),
               SizedBox(height: 40, width: 120,
               child: RaisedButton.icon(
                 onPressed: () {setState(() {
                   indicador = "Cruzeiro";
                   iconeSelecionado = Icons.directions_boat;
                   trocaLista(indicador);
                   });
                },
                 icon: Icon(Icons.directions_boat, 
                            size: 30), 
                 label:Text('Cruzeiros', 
                            textScaleFactor: 0.75,
                            ),
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
          SizedBox(height: 5),
          Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: 
                          Colors.lightBlue[300],
                          ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Pesquisar viagem",
                         textScaleFactor: 1.5,
                         style: TextStyle(
                                color: Colors.lightBlue[300],
                                fontWeight: FontWeight.bold)
                      ),
                      Icon(iconeSelecionado,
                           size: 30,)
                    ],
                  ),
                  SizedBox(height: 8),
                  textoComum(35.0, true, Icons.my_location, "Origem", txtOrigem),
                  SizedBox(height: 8),
                  textoComum(35.0, true, Icons.not_listed_location, "Destino", txtDestino),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 25, width: 85,
                        child: RaisedButton.icon(
                        onPressed: (){
                          realizarFiltroViagens(txtOrigem.text, txtDestino.text, indicador);
                        },
                        icon: Icon(Icons.search, size: 17.5), 
                        label:Text('Filtrar', textScaleFactor: 0.75,),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                        ),
                        color: Colors.lightBlue[300],
                      ),
                    ),
                    ],
                  ),
                ]
              ),
            ),
          StreamBuilder<QuerySnapshot>(
          stream: db.collection(colecao).snapshots(),
          builder:(context, snapshot){
          switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 8,
              )
            );
          default:
            if(listaSelecionada.length == 0){
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_off,
                        size: 70,
                        color: Colors.lightBlue[300]
                    ),
                    Text("Nenhum viagem encontrada!",
                        textScaleFactor: 1.25,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[300]
                        ),
                    )                        
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
              itemCount: listaSelecionada.length,
              itemBuilder: (context, index) {
              return Padding(
              padding: const EdgeInsets.all(3.0),
                child: Container(
                margin: EdgeInsets.all(3.0),
                padding: EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: 
                            Colors.lightBlue[300],
                            ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ExpansionTile(
                leading: Icon(iconeTipo(listaSelecionada[index].tipoViagem), size: 55),
                title: Text('${listaSelecionada[index].origem} - ${listaSelecionada[index].destino}',
                        style: TextStyle(fontWeight: FontWeight.bold,
                                         fontSize: 18),
                        ),
                subtitle: Text(
                           'Data: ${listaSelecionada[index].data}\n'
                           'Valor: ${listaSelecionada[index].valor}',
                           style: TextStyle(fontSize: 14),
                      ),
                trailing: Column(
                children: [
                  Text('${listaSelecionada[index].qtdePassagem}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                ),
                              ),
                  Icon(Icons.event_seat, 
                      size: 20,
                      color: qtdeDisponivel(listaSelecionada[index].qtdePassagem))
                  ],
                ),
            
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                  height: 25,
                  width: 100,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.add_shopping_cart , size: 17.5),
                    onPressed:() { 
                      Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ComprarPassagem( 
                                                                  idCliente: widget.idCliente,
                                                                  idViagem: listaSelecionada[index].id, 
                                                                  data: listaSelecionada[index].data, 
                                                                  origem: listaSelecionada[index].origem, 
                                                                  destino: listaSelecionada[index].destino,
                                                                  valor: listaSelecionada[index].valor,
                                                                  tipo: listaSelecionada[index].tipoViagem,)
                                                                  )
                                                      );
                                  },
                    label: Text("Comprar", textScaleFactor: 0.75,),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(1000.0),
                    ),
                  color: Colors.lightBlue[300],
                  ),
                ),
                ],
                )
              ],),  
              ],
            ),),
            );
          },),
        );
      }}),
        ],
      ),
      ),
      endDrawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                children: [
                SizedBox(height: 20),
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Passagens",
                           textScaleFactor: 3.0,
                           style: TextStyle(
                                  color: Colors.lightBlue[300],
                                  fontWeight: FontWeight.bold)
                        ),
                        Icon(Icons.style,
                             size: 50,
                             color: Colors.lightBlue[300])
                      ],
                    ),
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                stream: db.collection(passagens).snapshots(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if(listaPassagensUsuario.length == 0){
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.sentiment_dissatisfied,
                                  size: 45,
                                  color: Colors.lightBlue[300]
                              ),
                              Text("Nenhum passagem encontrada,\n"
                                   "volte ao menu Viagens e aproveite uma de nossas ofertas!",
                                  textScaleFactor: 0.75,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue[300]
                                  ),
                              )                        
                            ],
                          ),
                        );
                      }
                      else{
                      return Expanded(
                        child: ListView.builder(
                          itemCount: listaPassagensUsuario.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                margin: EdgeInsets.all(3.0),
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: 
                                    Colors.lightBlue[300],
                                    ),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                              child: ListTile(
                              leading: Icon(Icons.assignment_ind, 
                              color: padroesStatus(listaPassagensUsuario[index].status), 
                              size: 35),

                          title: Text('Código passagem: ${listaPassagensUsuario[index].idPassagem}\n'
                                       'Data: ${listaPassagensUsuario[index].data}',
                            style: TextStyle(fontWeight: FontWeight.bold, 
                                   fontSize: 15),
                          ),

                          subtitle: Text('Origem: ${listaPassagensUsuario[index].origem}\nDestino: ${listaPassagensUsuario[index].destino}\nStatus: ${listaPassagensUsuario[index].status}',
                            style: TextStyle(fontWeight: FontWeight.bold, 
                                     fontSize: 11)
                          ),

                          trailing: Icon(iconeTipo(listaPassagensUsuario[index].tipo),
                                        size: 35,),        
                          ),
                        ),);
                      })
                    );
                    }
                  }
                }
              ),
              ],
            ),
          ),
        ),
      )
    );
  }
}


  