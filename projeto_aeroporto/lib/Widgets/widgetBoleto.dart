import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Telas/confirmaCompra.dart';

class Boleto extends StatefulWidget {
const Boleto({
    this.idCliente,
    this.idViagem,
    this.data,
    this.origem, 
    this.destino, 
    this.valor,
    this.tipo,
 });

   final String idCliente;
   final String idViagem;
   final String data;
   final String origem;
   final String destino;
   final String valor;
   final String tipo;
  @override
  _BoletoState createState() => _BoletoState();
}

class _BoletoState extends State<Boleto> {

final db = Firestore.instance;
bool realizandoCompra = false;

verificarDados(String email) async {
  if(email.isEmpty){
    return setState(() {
      corAviso = Colors.red;
      textoAviso = "E-mail é obrigatório.";
     }
    );
  }

  if(!email.contains('@')){
    return setState(() {
      corAviso = Colors.red;
      textoAviso = "E-mail inválido.";
     }
    );
  }

  await db.collection("Passagens").add({
    "idCliente": widget.idCliente,
    "idViagem": widget.idViagem,
    "data": widget.data,
    "origem": widget.origem,
    "destino": widget.destino,
    "valor": widget.valor,
    "status": "Aguardando pagamento boleto",
    "tipo": widget.tipo
  });

  DocumentSnapshot viagem = await db.collection("Viagens").document(widget.idViagem).get();
  var qtdeAtual;

  setState(() {
    qtdeAtual = viagem.data["qtdePassagem"];
  });

  await db.collection("Viagens")
          .document(widget.idViagem)
          .updateData({
            "qtdePassagem": qtdeAtual - 1, 
          });

  Navigator.push(context, 
                MaterialPageRoute(builder: (context) => ConfirmaCompra(idCliente: widget.idCliente,
                                                                       mensagem: "Boleto gerado e enviado para o e-mail $email, após identificarmos seu pagamento sua passagem será liberada! Obrigado pela preferência."
                                                                      )
                                 )
                );
}
  TextEditingController txtEmail = TextEditingController();
  dynamic corAviso = Colors.white;
  dynamic textoAviso = "Vazio";
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
                        Text("Boleto Bancário", 
                           textAlign: TextAlign.center,
                           textScaleFactor: 1.5,
                           style: TextStyle(
                                  color: Colors.lightBlue[300],
                                  fontWeight: FontWeight.bold)
                        ),
                        SizedBox(height: 8),
                        textoParaEmail(35.0, true, (Icons.email), "E-mail para envio", txtEmail),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 35,
                              width: 165,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color:corAviso,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.warning,
                                    color: corAviso,
                                    ),
                                Text(textoAviso,
                                    style: TextStyle(
                                      color: corAviso,
                                    ),
                                ),
                            ],
                          ),
                        ),
                        realizandoCompra? 
                            Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[300]),
                                  )
                                ),
                                Text("Finalizando compra",
                                  textScaleFactor: 0.75,
                                  style: TextStyle(
                                    color: Colors.lightBlue[300],
                                    fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                            ) :    
                            SizedBox(
                              height: 25,
                              width: 90,
                              child: RaisedButton(
                                child: Text("Enviar"),
                                onPressed: (){
                                  setState(() {
                                    realizandoCompra = !realizandoCompra;
                                  });
                                  verificarDados(txtEmail.text);
                                }, 
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(1000.0),
                                ),
                                color: Colors.lightBlue[300],
                              ),
                            ),
                          ],
                        ),                        
                      ]
                    )
      ),
    );
  }
}