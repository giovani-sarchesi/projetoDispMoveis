import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alertInformativo(BuildContext context, String titulo, String texto, var botao){
  AlertDialog alerta = AlertDialog(
          title: Text(titulo, textAlign: TextAlign.center,),
          content: Text(texto, textAlign: TextAlign.center,),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
          ),
          actions: <Widget>[
            SizedBox(
              height: 30,
              width: 120,
                child: botao,
            )
          ],
        );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

alertConfirmativo(BuildContext context, String titulo, String texto, var botao1, var botao2){
  AlertDialog alerta = AlertDialog(
          title: Text(titulo, textAlign: TextAlign.center,),
          content: Text(texto, textAlign: TextAlign.center,),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
          ),
          actions: <Widget>[
            botao1,
            SizedBox(height: 10),
            botao2,
          ],
        );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
