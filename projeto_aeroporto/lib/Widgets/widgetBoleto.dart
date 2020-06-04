import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/confirmaCompra.dart';
import 'package:projeto_aeroporto/main.dart';

class Boleto extends StatefulWidget {
const Boleto({
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
  _BoletoState createState() => _BoletoState();
}

class _BoletoState extends State<Boleto> {

verificarDados(String email){
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

  listaTodasPassagens.add(Passagem((Icons.local_activity),
                                  listaTodasPassagens.length + 1,
                                  widget.idCliente,
                                  widget.idViagem,
                                  widget.data,
                                  widget.origem,
                                  widget.destino,
                                  widget.valor,
                                  "Aguardando pagamento boleto"));

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
                            SizedBox(
                              height: 25,
                              width: 90,
                              child: RaisedButton(
                                child: Text("Enviar"),
                                onPressed: (){
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