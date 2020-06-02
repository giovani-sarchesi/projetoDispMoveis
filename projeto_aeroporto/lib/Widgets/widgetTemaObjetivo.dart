import 'package:flutter/material.dart';

class TemaObjetivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: 
                        Colors.lightBlue[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/imagens/logoGK.png', 
                          height: 250, 
                          width: 250
                          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Tema:", 
                       textScaleFactor: 1.75,
                       style: TextStyle(color: Colors.lightBlue[300],
                                        fontWeight: FontWeight.bold),
                      ),
                  ],
              ),
              SizedBox(height:5),
                  Text("Aplicativo para compra de passagens para viagens de avião, ônibus e cruzeiros.",
                       style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),
                      ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Objetivo:", 
                       textScaleFactor: 1.75,
                       style: TextStyle(color: Colors.lightBlue[300],
                                        fontWeight: FontWeight.bold),
                      ),
                  ],
              ),
              SizedBox(height:5),
                  Text("Facilitar ao usuário a compra de passagem para viagens que o interessam, além de apresentar ao mesmo suas passagens já compradas!",
                       style: TextStyle(color: Colors.black,
                                        fontWeight: FontWeight.bold),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}