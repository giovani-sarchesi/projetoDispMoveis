import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    botaoIrSobre(context, new Botao((Icons.info_outline), "Sobre")),
                  ],
                ),
                Image.asset('assets/imagens/logoGK.png', height: 300, width: 300),
                botaoIrLogin(context, new Botao((Icons.check_circle), "Possuo conta"),),
                SizedBox(height: 10,),
                botaoIrCadastrar(context, new Botao((Icons.fiber_new), "Criar conta"),)
              ],
            ),
        )
      )
    );
  }
}