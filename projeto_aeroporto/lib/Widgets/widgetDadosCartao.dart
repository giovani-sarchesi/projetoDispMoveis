import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Telas/confirmaCompra.dart';
import 'dart:ui';


class DadosCartao extends StatefulWidget {
const DadosCartao({
    this.idCliente,
    this.idViagem,
    this.data,
    this.origem, 
    this.destino, 
    this.valor,
    this.tipo
 });

   final String idCliente;
   final String idViagem;
   final String data;
   final String origem;
   final String destino;
   final String valor;
   final String tipo;
  @override
  _DadosCartaoState createState() => _DadosCartaoState();
}

class _DadosCartaoState extends State<DadosCartao> {

final db = Firestore.instance;

verificarDados(String nomeCompleto, String cpfTitular, String nroCartao, String cvv, String validade){

   if(nomeCompleto.isEmpty || nroCartao.isEmpty || cvv.isEmpty || validade.isEmpty){
      return setState(() {
        textoInfoCartao = "Todos os dados são obrigatórios";
        iconeInfoCartao = (Icons.warning);
        corInfoCartao = Colors.red;        
        liberaBotao = true;
      });
   }

   if(nroCartao.length < 14){
     return setState(() {
        textoInfoCartao = "Cartão informado é inválido";
        iconeInfoCartao = (Icons.warning);
        corInfoCartao = Colors.red;        
        liberaBotao = true;
      });
   }

   if(cpfTitular.length < 14){
     return setState(() {
        textoInfoCartao = "CPF informado é inválido";
        iconeInfoCartao = (Icons.warning);
        corInfoCartao = Colors.red;
        liberaBotao = true;
      });
   }
   
  setState(() {
        textoInfoCartao = "Sucesso, a compra pode ser realizada";
        iconeInfoCartao = (Icons.verified_user);
        corInfoCartao = Colors.lightGreen;
        liberaBotao = !liberaBotao;
      });

  
}

confirmarCompra() async {
  await db.collection("Passagens").add({
    "idCliente": widget.idCliente,
    "idViagem": widget.idViagem,
    "data": widget.data,
    "origem": widget.origem,
    "destino": widget.destino,
    "valor": widget.valor,
    "status": "Pagamento confirmado",
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
                                                                       mensagem: "Compra realizada com sucesso! Obrigado pela preferência."
                                                                      )
                                 )
                );
}

TextEditingController nomeCompleto = TextEditingController();
TextEditingController cpfTitular = TextEditingController();
TextEditingController nroCartao = TextEditingController();
TextEditingController cvv = TextEditingController();
TextEditingController validade = TextEditingController();
dynamic iconeInfoCartao = (Icons.info);
dynamic textoInfoCartao = "Informe os dados do cartão";
dynamic corInfoCartao = Colors.grey;
bool liberaBotao = true;
bool realizandoCompra = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text("Dados do Cartão", 
                         textAlign: TextAlign.center,
                         textScaleFactor: 1.5,
                         style: TextStyle(
                                color: Colors.lightBlue[300],
                                fontWeight: FontWeight.bold)
                      ),
                  SizedBox(height: 8),
                  textoComum(35.0, true, (Icons.rate_review), "Nome Titular Cartão", nomeCompleto),                  
                  SizedBox(height: 8),
                  textoParaCPF(35.0, true, (Icons.featured_video), "CPF Titular do Cartão", cpfTitular, 14),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textoSomenteNumeros(220.0, 35.0, true, 16, (Icons.credit_card), "Número Cartão", nroCartao),
                      textoNumerosSemIcone(55.0, 35.0, true, 3, "CVV", cvv),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    textoParaData(165.0, 35.0, true, (Icons.today), "Validade", validade, 5),                      
                    SizedBox(
                      height: 35,
                      width: 100,
                      child: RaisedButton(
                        
                        child: Text("Verificar"),
                        onPressed: (){verificarDados(nomeCompleto.text,
                                      cpfTitular.text,
                                      nroCartao.text,
                                      cvv.text, 
                                      validade.toString());
                          }, 
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(1000.0),
                          ),
                          color: Colors.lightBlue[300],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color:corInfoCartao,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconeInfoCartao,
                            color: corInfoCartao,
                            ),
                        Text(textoInfoCartao,
                            style: TextStyle(
                              color: corInfoCartao,
                            ),
                        ),
                    ],
                    ),
                  ),
                  SizedBox(height: 8),
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
                              width: 150,
                              child: RaisedButton(
                                child: Text("Confirmar Compra"),
                                onPressed: liberaBotao ? null : (){
                                    setState(() {
                                      realizandoCompra = !realizandoCompra;
                                    });
                                    confirmarCompra();
                                }, 
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(1000.0),
                                ),
                                color: Colors.lightBlue[300],
                              ),
                            )
                ],
              ),
    );
  }
}