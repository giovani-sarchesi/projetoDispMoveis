import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Widgets/widgetGiovani.dart';
import 'package:projeto_aeroporto/Widgets/widgetKaue.dart';
import 'package:projeto_aeroporto/Widgets/widgetTemaObjetivo.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Row(
                  children: [
                    Text("Tema e Objetivo",
                        textScaleFactor: 1
                        ),
                    SizedBox(width: 2,),
                    Icon(Icons.receipt,
                        size: 18)
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Text("Desenvolvedores",
                        textScaleFactor: 1
                        ),
                    SizedBox(width: 2,),
                    Icon(Icons.people,
                        size: 18)
                  ],
                ),
              ),
            ])     
        ),
        body: TabBarView(children: <Widget>[
          TemaObjetivo(),
          SingleChildScrollView(
              child: Column(
              children: [
                SobreGiovani(),
                SobreKaue(),
              ],
            ),
          ),          
        ]),
    ),
    );
  }
}