import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/cadastrar.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/Telas/confirmaCompra.dart';
import 'package:projeto_aeroporto/Telas/login.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';
import 'package:projeto_aeroporto/Telas/sobre.dart';
import 'package:projeto_aeroporto/Telas/telaInicial.dart';

//Lista Dinâmica com os itens do ListView
List<Viagens> listaViagens = List();
List<Viagens> listaSelecionada = List();
List<Passagem> listaPassagensUsuario = List();
void main() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    runApp(MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [const Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          title: 'GK',
          initialRoute: '/telaInicial',
          routes: {
            '/telaInicial': (context) => TelaInicial(), 
            '/login': (context) => Login(),
            '/cadastrar': (context) => Cadastrar(),   
            '/menuApp': (context) => MenuApp(),
            '/compraPassagem': (context) => ComprarPassagem(),
            '/sobre': (context) => Sobre(),
            '/confirmaCompra': (context) => ConfirmaCompra(),
          },
        ));
}



