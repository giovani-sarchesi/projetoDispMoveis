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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
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
                      textoParaSobre(25.0, 165.0, (Icons.looks_one), "Login"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 165.0, (Icons.looks_two), "Cadastrar"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 165.0, (Icons.looks_3), "Pagamento"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 165.0, (Icons.looks_4), "Listas"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 165.0, (Icons.looks_5), "Sobre"),
                      SizedBox(height: 5),
                      textoParaSobre(25.0, 165.0, (Icons.looks_6), "Widgets"),
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