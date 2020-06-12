import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/main.dart';

class ListaViagens extends StatelessWidget {
const ListaViagens({
  this.idCliente,
});

final int idCliente;

  @override
  Widget build(BuildContext context) {
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
              leading: Icon(listaSelecionada[index].icone, size: 55),

              title: Text('${listaSelecionada[index].origem} - ${listaSelecionada[index].destino}',
                          style: TextStyle(fontWeight: FontWeight.bold,
                                           fontSize: 18),
                          ),
              
              subtitle: Text('Data: ${listaSelecionada[index].data}\n'
                             'Valor: ${listaSelecionada[index].valor}',
                             style: TextStyle(fontSize: 14),
                        ),
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 25,
                  width: 100,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.map , size: 17.5),
                    onPressed: null,
                    label: Text("Onde ir?", textScaleFactor: 0.75,),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(1000.0),
                    ),
                  color: Colors.lightBlue[300],
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 100,
                  child: RaisedButton.icon(
                    icon: Icon(Icons.account_balance_wallet , size: 17.5),
                    onPressed:() { 
                      Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ComprarPassagem( 
                                                                  idCliente: idCliente,
                                                                  idViagem: listaSelecionada[index].idViagem, 
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
                )
              ]
            )
              ],
            ),  
          ],
        ),
        ),
    );
},),
      
    );
  }
}