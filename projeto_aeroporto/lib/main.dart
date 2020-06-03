import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/cadastrar.dart';
import 'package:projeto_aeroporto/Telas/compraPassagem.dart';
import 'package:projeto_aeroporto/Telas/login.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';
import 'package:projeto_aeroporto/Telas/sobre.dart';
import 'package:projeto_aeroporto/Telas/telaInicial.dart';

//Lista Dinâmica com os itens do ListView
List<Voo> listaVoos = [];
List<Onibus> listaOnibus = [];
List<Cruzeiros> listaCruzeiros = [];
List<Passagem> listaTodasPassagens = [];
List<Passagem> listaPassagensUsuario = [];
List<Cliente> clientes = [];

void main() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    listaVoos.add(Voo((Icons.flight_takeoff), 1, "Ribeirão Preto", "São Paulo", "1.250,00", "27/06/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 2, "Ribeirão Preto", "João Pessoa", "1.350,00", "27/06/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 3, "Ribeirão Preto", "Campinas", "830,99", "27/06/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 4, "Ribeirão Preto", "Porto Alegre", "1.100,50", "22/06/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 13, "Ribeirão Preto", "Natal", "1.800,00", "15/07/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 14, "Ribeirão Preto", "Recife", "2.330,00", "18/09/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 15, "Ribeirão Preto", "Santa Catarina", "1.650,99", "27/09/2020"));
    listaVoos.add(Voo((Icons.flight_takeoff), 16, "Ribeirão Preto", "Brasília", "1.900,50", "14/8/2020"));

    listaOnibus.add(Onibus((Icons.directions_bus), 5, "Ribeirão Preto", "São Paulo", "100,00", "27/07/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 6, "Ribeirão Preto", "Santos", "115,00", "10/06/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 7, "Ribeirão Preto", "Uberlândia", "60,00", "11/11/2020"));
    listaOnibus.add(Onibus((Icons.directions_bus), 8, "Ribeirão Preto", "Miguelópolis", "45,50", "13/07/2020"));

    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 9, "Santos", "Buenos Aires", "2.000,00", "27/07/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 10, "Rio de Janeiro", "Santos", "3.250,00", "27/08/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 11, "Espiríto Santo", "Fernando de Noronha", "1.860,00", "27/09/2020"));
    listaCruzeiros.add(Cruzeiros((Icons.directions_boat), 12, "Praia Grande", "Cancun", "2.750,50", "27/06/2020"));

    listaTodasPassagens.add(Passagem((Icons.local_activity), 1, 1, 1,"27/06/2020","Ribeirão Preto", "São Paulo", "1.250,00", "Paga"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 2, 1, 1,"27/06/2020","Ribeirão Preto", "São Paulo", "1.250,00", "Paga"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 3, 1, 1,"27/06/2020","Ribeirão Preto", "São Paulo", "1.250,00", "Aguardando pagamento"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 4, 3, 1,"27/06/2020","Ribeirão Preto", "São Paulo", "1.250,00", "Aguardando pagamento"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 5, 4, 9,"27/07/2020","Santos", "Buenos Aires", "2.000,00", "Paga"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 6, 4, 9,"27/07/2020","Santos", "Buenos Aires", "2.000,00", "Paga"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 7, 4, 12,"27/06/2020","Praia Grande", "Cancun", "2.750,50", "Paga"));
    listaTodasPassagens.add(Passagem((Icons.local_activity), 8, 3, 12,"27/06/2020","Praia Grande", "Cancun", "2.750,50", "Aguardando pagamento"));

    clientes.add(Cliente(1, "11111111111", "Cliente Um", "cliente1@gmail.com", "cliente1"));
    clientes.add(Cliente(2, "22222222222", "Cliente Dois", "cliente2@gmail.com", "cliente2"));
    clientes.add(Cliente(3, "33333333333", "Cliente Três", "cliente3@gmail.com", "cliente3"));

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
          },
        ));
}



