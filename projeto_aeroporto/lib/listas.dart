import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/classes.dart';

//Lista Dinâmica com os itens do ListView
List<Voo> listaVoos = [];
List<Onibus> listaOnibus = [];
List<Cruzeiros> listaCruzeiros = [];

class ListaVoos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
      return Expanded(
            child: ListView.builder(
              itemCount: listaVoos.length, // total de itens da lista
              itemBuilder: _listaVoos, // aparência dos itens da lista
            ),
      );
  }
}

Widget _listaVoos(context, index) {
    return Card(
      child: ListTile(
        leading: Icon(listaVoos[index].icone, 
                      color: Colors.blue[800], 
                      size: 65),

        title: Text(
          '${listaVoos[index].origem} para ${listaVoos[index].destino}:',
          style: TextStyle(fontWeight: FontWeight.bold, 
                           fontSize: 12),
               ),

        subtitle: Text('Valor: ${listaVoos[index].valor}',
            style: TextStyle(fontWeight: FontWeight.bold, 
                             fontSize: 10)
                  ),

        trailing: Icon(Icons.monetization_on,
                      color: Colors.yellowAccent[700])
        ),
      );
}

class ListaOnibus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Expanded(
            child: ListView.builder(
              itemCount: listaOnibus.length, // total de itens da lista
              itemBuilder: _listaOnibus, // aparência dos itens da lista
            ),
      );
  }
}

Widget _listaOnibus(context, index) {
    return Card(
      child: ListTile(
        leading: Icon(listaOnibus[index].icone, 
                      color: Colors.blue[800], 
                      size: 65),

        title: Text(
          '${listaOnibus[index].origem} para ${listaOnibus[index].destino}:',
          style: TextStyle(fontWeight: FontWeight.bold, 
                           fontSize: 12),
               ),

        subtitle: Text('Valor: ${listaOnibus[index].valor}',
            style: TextStyle(fontWeight: FontWeight.bold, 
                             fontSize: 10)
                  ),

        trailing: Icon(Icons.monetization_on,
                      color: Colors.yellowAccent[700])
        ),
      );
}

class ListaCruzeiros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Expanded(
            child: ListView.builder(
              itemCount: listaCruzeiros.length, // total de itens da lista
              itemBuilder: _listaCruzeiros, // aparência dos itens da lista
            ),
      );
  }
}

Widget _listaCruzeiros(context, index) {
    return Card(
      child: ListTile(
        leading: Icon(listaCruzeiros[index].icone, 
                      color: Colors.blue[800], 
                      size: 65),

        title: Text(
          '${listaCruzeiros[index].origem} para ${listaCruzeiros[index].destino}:',
          style: TextStyle(fontWeight: FontWeight.bold, 
                           fontSize: 12),
               ),

        subtitle: Text('Valor: ${listaCruzeiros[index].valor}',
            style: TextStyle(fontWeight: FontWeight.bold, 
                             fontSize: 10)
                  ),

        trailing: Icon(Icons.monetization_on,
                      color: Colors.yellowAccent[700])
        ),
      );
}

