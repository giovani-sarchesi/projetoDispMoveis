import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';

botaoIrLogin(BuildContext context, Botao botao){
    return SizedBox(
           height: 30,
           width: 120,
            child: RaisedButton.icon(
                icon: Icon(botao.icone , size: 17.5),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login');
                },
                label: Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
              ),
    );
}

botaoIrCadastrar(BuildContext context, Botao botao){
  return SizedBox(
         height: 30,
         width: 120,
          child: RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/cadastrar');
                },
                icon: Icon(botao.icone, size: 17.5), 
                label:Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
            ),
  );
}

botaoIrMenu(BuildContext context, Botao botao, int id){
  return SizedBox(
         height: 30,
         width: 120,
          child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuApp(idCliente: id)));
                },
                icon: Icon(botao.icone, size: 17.5), 
                label:Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
            ),
  );
}

botaoTelaInicial(BuildContext context, Botao botao){
  return SizedBox(
         height: 30,
         width: 120,
          child: RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/telaInicial');
                },
                icon: Icon(botao.icone, size: 17.5), 
                label:Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
            ),
  );
}

botaoFecharAlert(BuildContext context, Botao botao){
  return SizedBox(
         height: 30,
         width: 120,
          child: RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(botao.icone, size: 17.5), 
                label:Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
            ),
  );
}

botaoIrSobre(BuildContext context, Botao botao){
  return SizedBox(
         height: 30,
         width: 120,
          child: RaisedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/sobre');
                },
                icon: Icon(botao.icone, size: 17.5), 
                label:Text(botao.label, textScaleFactor: 0.75,),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(1000.0),
                ),
                color: Colors.lightBlue[300],
            ),
  );
}
