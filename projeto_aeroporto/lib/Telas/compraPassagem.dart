import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';
import 'package:projeto_aeroporto/Widgets/widgetBoleto.dart';
import 'package:projeto_aeroporto/Widgets/widgetDadosCartao.dart';
import 'package:projeto_aeroporto/Widgets/widgetDepositos.dart';
import 'package:projeto_aeroporto/Widgets/widgetSelecione.dart';

class ComprarPassagem extends StatefulWidget {
const ComprarPassagem({
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
  _ComprarPassagemState createState() => _ComprarPassagemState();
}

class _ComprarPassagemState extends State<ComprarPassagem> {
  
  int _indexAtual = 0;
  Widget atual = Selecione(texto: "Selecione uma forma de\npagamento no menu abaixo.", 
                          icone: (Icons.arrow_downward));
  TextEditingController origem = TextEditingController();
  TextEditingController destino = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController nomeCompleto = TextEditingController();
  TextEditingController cpfTitular = TextEditingController();
  TextEditingController nroCartao = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController validade = TextEditingController();

void verificarSelecionado(int index){
  switch (index) {
    case 0:
      setState(() {
        atual = DadosCartao(idCliente: widget.idCliente,
                            idViagem: widget.idViagem,
                            data: widget.data,
                            origem: widget.origem,
                            destino: widget.destino,
                            valor: widget.valor);
                            _indexAtual = index; 
                    }
      );     
      break;
    case 1:
      setState(() {
                      atual = Boleto(idCliente: widget.idCliente,
                       idViagem: widget.idViagem,
                       data: widget.data,
                       origem: widget.origem,
                       destino: widget.destino,
                       valor: widget.valor);
                       _indexAtual = index;
                    });
      break;
    case 2:
      setState(() {
                      atual = Deposito(idCliente: widget.idCliente,
                        idViagem: widget.idViagem,
                        data: widget.data,
                        origem: widget.origem,
                        destino: widget.destino,
                        valor: widget.valor);
                        _indexAtual = index;
                    });
      break;      
  }
}

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Pagamento"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
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
                    Text("Viagem Selecionada", 
                       textAlign: TextAlign.center,
                       textScaleFactor: 1.5,
                       style: TextStyle(
                              color: Colors.lightBlue[300],
                              fontWeight: FontWeight.bold)
                      ),
                    SizedBox(height: 8),
                    textoComum(35.0, false, (Icons.location_on), widget.origem, origem),        
                    SizedBox(height: 8),
                    textoComum(35.0, false, (Icons.location_searching), widget.destino, destino),
                    SizedBox(height: 8),
                    textoComum(35.0, false, (Icons.monetization_on), widget.valor, valor),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      textoParaData(165.0, 35.0, false, (Icons.calendar_today), widget.data, data),                  
                    SizedBox(
                    height: 35,
                    width: 100,
                    child: RaisedButton(
                      child: Text("Alterar"),
                      onPressed: (){
                         Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MenuApp(
                                      idCliente: widget.idCliente,
                                    ))
                                    );
                      }, 
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(1000.0),
                      ),
                      color: Colors.lightBlue[300],
                    ),
                ),
              ],
             ),
            ],
          ),
        ),
            
        atual,
          
        ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
           items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            title: Text("Cartão"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.assignment),
             title: Text("Boleto"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              title: Text("Depósito"),
            ),
          ],
          currentIndex: _indexAtual,
          selectedItemColor: Colors.lightBlue[300],
          onTap: verificarSelecionado,
        ),
    );
  }
}