import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/main.dart';

class Deposito extends StatefulWidget {
const Deposito({
  this.idCliente,
  this.idViagem,
  this.data,
  this.origem, 
  this.destino, 
  this.valor,
 });

   final int idCliente;
   final int idViagem;
   final String data;
   final String origem;
   final String destino;
   final String valor;

  @override
  _DepositoState createState() => _DepositoState();
}

class _DepositoState extends State<Deposito> {

comprarPassagem(){
  alertInformativo(context, 
                   "Pedido realizado com sucesso.", 
                   "Assim que recebermos seu depósito sua passagem ficará disponível!",
                   botaoIrMenu(context, new Botao((Icons.check_circle), "Ir ao menu"), widget.idCliente)
                  );

  listaTodasPassagens.add(Passagem((Icons.local_activity),
                                  listaTodasPassagens.length + 1,
                                  widget.idCliente,
                                  widget.idViagem,
                                  widget.data,
                                  widget.origem,
                                  widget.destino,
                                  widget.valor,
                                  "Aguardando depósito"));
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
                        Text("Depósito Bancário", 
                           textAlign: TextAlign.center,
                           textScaleFactor: 1.5,
                           style: TextStyle(
                                  color: Colors.lightBlue[300],
                                  fontWeight: FontWeight.bold)
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.account_balance, size: 65,),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text("Banco: Banco do Brasil\nAgência: 2572\nConta: 95436-1", 
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textScaleFactor: 1.1,),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                        height: 25,
                        width: 120,
                        child: RaisedButton(
                          child: Text("Fazer pedido"),
                          onPressed: (){
                            comprarPassagem();
                          }, 
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(1000.0),
                          ),
                          color: Colors.lightBlue[300],
                        ),
                        ),
                      ]
                    )
      ),
    );
  }
}