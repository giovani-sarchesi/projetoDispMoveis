import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/main.dart';
import 'dart:ui';


class DadosCartao extends StatefulWidget {
const DadosCartao({
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
  _DadosCartaoState createState() => _DadosCartaoState();
}

class _DadosCartaoState extends State<DadosCartao> {

verificarDados(String nomeCompleto, String nroCartao, String cvv, String validade){

   if(nomeCompleto.isEmpty || nroCartao.isEmpty || cvv.isEmpty || validade.isEmpty || validade == "Validade"){
      return alertConfirmativo(context, 
                        "Dados incorretos",
                        "Todos os dados são obrigatórios!", 
                        botaoFecharAlert(context, new Botao((Icons.edit), "Editar dados")), 
                        botaoIrMenu(context, new Botao((Icons.assignment_return), "Ir ao menu"), widget.idCliente));
   }

   if(nroCartao.length < 14){
     return alertConfirmativo(context, 
                        "Dados incorretos",
                        "Cartão informado é inválido!", 
                        botaoFecharAlert(context, new Botao((Icons.edit), "Editar dados")), 
                        botaoIrMenu(context, new Botao((Icons.assignment_return), "Ir ao menu"), widget.idCliente));
   }
   
   alertInformativo(context, 
                   "Compra realizada com sucesso!", 
                   "Obrigado pela preferência :D",
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
                                  "Paga"));
}

TextEditingController nomeCompleto = TextEditingController();
TextEditingController cpfTitular = TextEditingController();
TextEditingController nroCartao = TextEditingController();
TextEditingController cvv = TextEditingController();
dynamic validade = "Validade";
DateTime dataSelecionada = new DateTime.now();

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
                  textoParaCPF(35.0, true, (Icons.featured_video), "CPF Titular do Cartão", cpfTitular),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          icon: Icon(Icons.calendar_today,
                                    color: Colors.grey),
                          onPressed:() async {
                              DatePicker.showDatePicker(
                              context,
                              showTitleActions: true, 
                              minTime: DateTime.now(), 
                              maxTime: DateTime(2100),
                              locale: LocaleType.pt,
                              onConfirm: (date){
                                setState(() {
                                  validade = '${formatDate(date, [mm, '/', yyyy ])}';
                                });
                              },
                            );                
                        }
                      ),
          SizedBox(
            height: 35,
            width: 120,
            child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: validade,
            ),
            ),
          ), 
          SizedBox(width: 12,),                
                  SizedBox(
                      height: 35,
                      width: 100,
                      child: RaisedButton(
                        child: Text("Confirmar"),
                        onPressed: (){
                          verificarDados(nomeCompleto.text, 
                                         nroCartao.text,
                                         cvv.text, 
                                         validade.toString());

                          debugPrint(validade.toString());
                          }, 
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(1000.0),
                        ),
                        color: Colors.lightBlue[300],
                      ),
                  ),
                ],
               )
              ],
            ),
    );
  }
}