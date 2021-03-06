import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';

class SobreGiovani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: 
                              Colors.lightBlue[300],
                              ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
      child: SizedBox(
          child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.all(2.0),
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: 
                              Colors.lightBlue[300],
                              ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/imagens/devGiovani.jpg')
                            )
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Giovani Sarchesi", 
                          textScaleFactor: 1.20,
                          style: TextStyle(color: Colors.lightBlue[300],
                                           fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [                      
                      Text("Desenvolveu:",
                          textScaleFactor: 1.20,
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold),
                          ),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_1), "Login"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_2), "Menu"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_3), "Pagamento"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_4), "Listas"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_5), "Sobre"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_6), "Widgets"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 300.0, (Icons.filter_7), "Confirma Compra"),
                    ],
                  ),
                ],
              ),
            ),
          ),  
      ),
    );
  }
}