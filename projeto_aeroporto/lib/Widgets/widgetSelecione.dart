import 'package:flutter/material.dart';

class Selecione extends StatelessWidget {
const Selecione({
  this.texto,
  this.icone,
});

  final String texto;
  final dynamic icone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(texto,
               textAlign: TextAlign.center,
               textScaleFactor: 1.5,
               style: TextStyle(fontWeight: FontWeight.bold,
                                color: Colors.lightBlue[300]),
              ),
          Icon(icone, 
               size: 50,
               color: Colors.lightBlue[300],),
        ],
      ),
      
    );
  }
}