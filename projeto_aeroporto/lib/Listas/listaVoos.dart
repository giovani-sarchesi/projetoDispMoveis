import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/main.dart';

class ListaVoos extends StatelessWidget {
const ListaVoos({
  this.idCliente,
});

final int idCliente;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listaVoos.length,
        itemBuilder: (context, index) {
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
          leading: Icon(listaVoos[index].icone, size: 45),

          title: Text('${listaVoos[index].origem} - ${listaVoos[index].destino}',
                      style: TextStyle(fontWeight: FontWeight.bold,
                                       fontSize: 14),
                      ),
          
          subtitle: Text('Data: ${listaVoos[index].data}\n'
                         'Valor: ${listaVoos[index].valor}',
                         style: TextStyle(fontSize: 12),
                    ),

          trailing: IconButton(icon: Icon(Icons.arrow_forward_ios, 
                                          size: 20),
                                   color: Colors.black, 
                                   onPressed: () { 
                                      Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => ComprarPassagem( 
                                                              idCliente: idCliente,
                                                              idViagem: listaVoos[index].nroVoo, 
                                                              data: listaVoos[index].data, 
                                                              origem: listaVoos[index].origem, 
                                                              destino: listaVoos[index].destino,
                                                              valor: listaVoos[index].valor)
                                                              )
                                                  );
                                   },
                                ),
          ),
        ),
    );
},),
      
    );
  }
}