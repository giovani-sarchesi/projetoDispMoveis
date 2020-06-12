import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Listas/listaPassagens.dart';
import 'package:projeto_aeroporto/Listas/listaViagens.dart';
import 'package:projeto_aeroporto/Telas/telaInicial.dart';
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

Widget lista;
var indicador = "Todas";
bool tipoFiltro = true;
var corTodas = Colors.white;
var corVoos = Colors.black;
var corOnibus = Colors.black;
var corCruzeiro = Colors.black;
var corPassagens = Colors.black;

verificaPassagens(){
  if(listaPassagensUsuario.length == 0){
    return alertInformativo(context, 
                            "Você ainda não comprou nenhuma passagem :/", 
                            "",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }
  else{
    corTodas = Colors.black;
    corVoos = Colors.black;
    corOnibus = Colors.black;
    corCruzeiro = Colors.black;
    corPassagens = Colors.white;
    return lista = ListaPassagens();
  }
}

realizarFiltroViagens(String filtroOrigem, String filtroDestino, String tipoViagem){
   if(filtroOrigem.isEmpty && filtroDestino.isEmpty){
    return alertInformativo(context, 
                      "Impossível filtrar.", 
                      "Pelo menos um dos filtros devem ser informados.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
   }

   if(tipoViagem != "Todas"){
      listaSelecionada = listaViagens.where((element) => element.tipoViagem == tipoViagem).toList();
   }
   else{
     listaSelecionada = listaViagens.toList();
   }

   if(filtroDestino.isEmpty && filtroOrigem.isNotEmpty){
      setState(() {       
       listaSelecionada = listaSelecionada.where((element) => element.origem.toUpperCase().contains(filtroOrigem.toUpperCase())).toList();
       if(listaSelecionada.length == 0){
         return alertInformativo(context, 
                      "Nenhuma viagem encontrada.", 
                      "Desculpe, mas nenhuma viagem tem como origem a cidade de $filtroOrigem do tipo $tipoViagem", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaViagens(idCliente: widget.idCliente);
      });
   }

   if(filtroOrigem.isEmpty && filtroDestino.isNotEmpty){
      setState(() {
       listaSelecionada = listaSelecionada.where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase())).toList();
       if(listaSelecionada.length == 0){
         return alertInformativo(context, 
                      "Nenhuma viagem encontrada.", 
                      "Desculpe, mas nenhuma viagem tem como destino a cidade de $filtroDestino.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaViagens(idCliente: widget.idCliente);
      });
   }

   if(filtroOrigem.isNotEmpty && filtroDestino.isNotEmpty){
     setState(() {
       listaSelecionada = listaSelecionada.where((element) => element.destino.toUpperCase().contains(filtroDestino.toUpperCase()) && 
                                                              element.origem.toUpperCase().contains(filtroOrigem.toUpperCase())).toList();
       if(listaSelecionada.length == 0){
         return alertInformativo(context, 
                      "Nenhuma viagem encontrada.", 
                      "Desculpe, mas nenhuma viagem tem como origem de $filtroOrigem e o destino de $filtroDestino.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaViagens(idCliente: widget.idCliente);
      });
   }
}

realizarFiltroPassagens(String origem, String destino){
  if(origem.isEmpty && destino.isEmpty){
    return alertInformativo(context, 
                      "Impossível filtrar.", 
                      "Pelo menos um dos filtros devem ser informados.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
  }

  listaPassagensUsuario = listaTodasPassagens.where((element) => element.idPassageiro == widget.idCliente).toList();

  if(destino.isEmpty && origem.isNotEmpty){
      setState(() {       
       listaPassagensUsuario = listaPassagensUsuario.where((element) => element.origem.toUpperCase().contains(origem.toUpperCase())).toList();
       if(listaPassagensUsuario.length == 0){
         return alertInformativo(context, 
                      "Nenhuma passagem encontrada.", 
                      "Você não comprou nenhuma passagem com origem de $origem.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaPassagens();
      });
  }

   if(origem.isEmpty && destino.isNotEmpty){
      setState(() {       
       listaPassagensUsuario = listaPassagensUsuario.where((element) => element.destino.toUpperCase().contains(destino.toUpperCase())).toList();
       if(listaPassagensUsuario.length == 0){
         return alertInformativo(context, 
                      "Nenhuma passagem encontrada.", 
                      "Você não comprou nenhuma passagem com destino para $destino.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaPassagens();
      });
   }

   if(origem.isNotEmpty && destino.isNotEmpty){
     setState(() {
       listaPassagensUsuario = listaPassagensUsuario.where((element) => element.destino.toUpperCase().contains(destino.toUpperCase()) && 
                                                                        element.origem.toUpperCase().contains(origem.toUpperCase())).toList();
       if(listaPassagensUsuario.length == 0){
         return alertInformativo(context, 
                      "Nenhuma viagem encontrada.", 
                      "Você ainda não comprou nenhuma viagem com origem de $origem para $destino.", 
                      botaoFecharAlert(context, new Botao(Icons.keyboard_return, "Voltar"))
                     );
       }
       return lista = ListaPassagens();
      });
   }
}

@override void initState(){
  super.initState();
  setState(() {
    listaSelecionada = listaViagens;
    lista = ListaViagens(idCliente: widget.idCliente,);
  });
}

@override Widget build(BuildContext context) {
    if(indicador == "Passagens"){
      tipoFiltro = false;
    }
    else{
      tipoFiltro = true;
    }

    listaPassagensUsuario = listaTodasPassagens.where((element) => element.idPassageiro == widget.idCliente).toList();
    TextEditingController txtOrigem = TextEditingController();
    TextEditingController txtDestino = TextEditingController();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Menu"),
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
                        corTodas = Colors.white;
                        corVoos = Colors.black;
                        corOnibus = Colors.black;
                        corCruzeiro = Colors.black;
                        corPassagens = Colors.black;
                        listaSelecionada = listaViagens;
                        indicador = "Todas";
                        lista = ListaViagens(idCliente: widget.idCliente);
                      });}, 
                      icon: Icon(Icons.blur_on, 
                                 size: 30, 
                                 color: corTodas), 
                      label:Text('Todas', 
                                 textScaleFactor: 0.75, 
                                 style: TextStyle(
                                   color: corTodas),
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
                        corTodas = Colors.black;
                        corVoos = Colors.white;
                        corOnibus = Colors.black;
                        corCruzeiro = Colors.black;
                        corPassagens = Colors.black;
                        listaSelecionada = listaViagens.where((element) => element.tipoViagem == "Voo").toList();
                        indicador = "Voo";
                        lista = ListaViagens(idCliente: widget.idCliente);
                      });}, 
                      icon: Icon(Icons.flight_takeoff, 
                                 size: 30,
                                 color: corVoos), 
                      label:Text('Vôos', 
                                 textScaleFactor: 0.75,
                                 style: TextStyle(
                                   color: corVoos),
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
                        corTodas = Colors.black;
                       corVoos = Colors.black;
                       corOnibus = Colors.white;
                       corCruzeiro = Colors.black;
                       corPassagens = Colors.black;
                        listaSelecionada = listaViagens.where((element) => element.tipoViagem == "Onibus").toList();
                        indicador = "Onibus";
                        lista = ListaViagens(idCliente: widget.idCliente);
                      });},
                      icon: Icon(Icons.directions_bus, 
                                 size: 30,
                                 color: corOnibus,), 
                      label:Text('Ônibus', 
                                 textScaleFactor: 0.75,
                                 style: TextStyle(
                                   color: corOnibus),
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
                       corTodas = Colors.black;
                       corVoos = Colors.black;
                       corOnibus = Colors.black;
                       corCruzeiro = Colors.white;
                       corPassagens = Colors.black;
                       listaSelecionada = listaViagens.where((element) => element.tipoViagem == "Cruzeiro").toList();
                       indicador = "Cruzeiro";
                       lista = ListaViagens(idCliente: widget.idCliente);
                     });},
                     icon: Icon(Icons.directions_boat, 
                                size: 30,
                                color: corCruzeiro), 
                     label:Text('Cruzeiros', 
                                textScaleFactor: 0.75,
                                style: TextStyle(
                                  color: corCruzeiro),
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
                     onPressed: (){setState(() {
                       indicador = "Passagens";
                       verificaPassagens();
                     });},
                     icon: Icon(Icons.style, 
                                size: 30,
                                color: corPassagens,
                               ), 
                     label:Text('Minhas\nPassagens', 
                                textScaleFactor: 0.75,
                                style: TextStyle(
                                 color: corPassagens),
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
                      Text("Pesquisar viagem",
                         textScaleFactor: 1.5,
                         style: TextStyle(
                                color: Colors.lightBlue[300],
                                fontWeight: FontWeight.bold)
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
                            onPressed: tipoFiltro ? (){realizarFiltroViagens(txtOrigem.text, txtDestino.text, indicador);} :
                                (){realizarFiltroPassagens(txtOrigem.text, txtDestino.text);},
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
              lista,
            ],
          ),
        )
      )
    );
  }
}


  