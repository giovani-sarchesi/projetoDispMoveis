import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/main.dart';

class ListaCruzeiros extends StatelessWidget {
const ListaCruzeiros({
  this.idCliente,
});

final int idCliente;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listaCruzeiros.length,
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
          leading: Icon(listaCruzeiros[index].icone, size: 45),

          title: Text('${listaCruzeiros[index].origem} - ${listaCruzeiros[index].destino}',
                      style: TextStyle(fontWeight: FontWeight.bold,
                                       fontSize: 14),
                      ),
          
          subtitle: Text('Data: ${listaCruzeiros[index].data}\n'
                         'Valor: ${listaCruzeiros[index].valor}',
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
                                                              idViagem: listaCruzeiros[index].nroCruzeiro, 
                                                              data: listaCruzeiros[index].data, 
                                                              origem: listaCruzeiros[index].origem, 
                                                              destino: listaCruzeiros[index].destino,
                                                              valor: listaCruzeiros[index].valor)
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