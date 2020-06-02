import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
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
  if(!email.contains('@')){
    return alertConfirmativo(context, 
                        "Dados incorretos",
                        "E-mail informado é inválido!", 
                        botaoFecharAlert(context, new Botao((Icons.edit), "Editar dados")), 
                        botaoIrMenu(context, new Botao((Icons.assignment_return), "Ir ao menu"), widget.idCliente));
  }
  
   alertInformativo(context, 
                   "Boleto enviado com sucesso!", 
                   "Boleto enviado para o e-mail ${txtEmail.text}, após o pagamento sua passagem estará liberada.",
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
                                  "Aguardando pagamento boleto"));
}
  TextEditingController txtEmail = TextEditingController();

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
                        SizedBox(
                        height: 25,
                        width: 120,
                        child: RaisedButton(
                          child: Text("Enviar Boleto"),
                          onPressed: (){
                            verificarDados(txtEmail.text);
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