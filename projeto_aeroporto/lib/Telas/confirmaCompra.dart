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
animaIcone(){
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1100), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1300), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1400), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1600), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1700), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1900), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2100), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2300), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2400), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2600), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2700), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2800), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2900), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        tamanhoIcon = tamanhoIcon + 10.0;
      });
    });
}

  dynamic tamanhoIcon = 0.0;
  dynamic corTexto = Colors.white;
  dynamic corAguarda = Colors.lightBlue[300];

@override
  void initState() {
    super.initState();
    animaIcone();
    Future.delayed(Duration(seconds: 4), () {
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
                style: TextStyle(color: corAguarda,
                                fontWeight: FontWeight.bold
                                ),
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      ),
            IconButton(icon: Icon(Icons.arrow_forward_ios,
                                  color: corAguarda,), 
                       onPressed: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuApp(idCliente: widget.idCliente)),
                                                      ModalRoute.withName('/')
                                                      );
                       })
        ]),
      ),
    );
  }
}