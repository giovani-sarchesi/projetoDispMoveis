import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/main.dart';

class ListaPassagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Expanded(
      child: ListView.builder(
         itemCount: listaPassagensUsuario.length,
         itemBuilder: _listaPassagens,
      ),      
    );
  }
}

Widget _listaPassagens(context, index){
  
  corIcone(String status){
    if(status == "Paga"){
      return Colors.green;
    }
    else{
      return Colors.red;
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
          leading: Icon(listaPassagensUsuario[index].icone, 
                        color: corIcone(listaPassagensUsuario[index].status), 
                        size: 55),

          title: Text(
            'Número passagem: ${listaPassagensUsuario[index].idPassagem}\nData: ${listaPassagensUsuario[index].data}',
            style: TextStyle(fontWeight: FontWeight.bold, 
                             fontSize: 18),
                 ),

          subtitle: Text('Origem: ${listaPassagensUsuario[index].origem}\nDestino: ${listaPassagensUsuario[index].destino}\nStatus: ${listaPassagensUsuario[index].status}',
              style: TextStyle(fontWeight: FontWeight.bold, 
                               fontSize: 14)
                    ),

          trailing: Icon(iconeTipo(listaPassagensUsuario[index].tipo),
                        size: 50,),
          ),
        ),
    );
}

