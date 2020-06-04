import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';

class ConfirmaCompra extends StatefulWidget {
const ConfirmaCompra({
  this.mensagem,
  this.idCliente,
});

  final String mensagem;
  final int idCliente;
  @override
  State<StatefulWidget> createState() => new _ConfirmaCompraState();
}

class _ConfirmaCompraState extends State<ConfirmaCompra> {
  dynamic tamanhoIcon = 250.0;
  dynamic corTexto = Colors.white;
  dynamic corAguarda = Colors.lightBlue[300];

@override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
  // 5s over, navigate to a new page
    setState(() {
      corAguarda = corTexto;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(Icons.check_circle,
                size: tamanhoIcon,
                color: Colors.white,
                ),
            Text(widget.mensagem,
                style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold
                                ),
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      ),
            IconButton(icon: Icon(Icons.arrow_forward_ios,
                                  color: corAguarda,), 
                       onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MenuApp(idCliente: widget.idCliente,)));
                       })
        ]),
      ),
    );
  }
}