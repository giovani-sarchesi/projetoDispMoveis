import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/telaInicial.dart';
import 'login.dart';

void main() {
    runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'GK',
          initialRoute: '/login',
          routes: {
            '/login': (context) => Login(),
            '/telaInicial': (context) => TelaInicial(),        
          },
        ));
}



