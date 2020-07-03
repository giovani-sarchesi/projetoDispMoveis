
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_shifter/mask_shifter.dart';

textoComum(altura, editavel, icone, label, controle){
  return SizedBox(
        height: altura,
        child: TextFormField(
        enabled: editavel,
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoParaData(largura, altura, editavel, icone, label, controle, tamanho){
 return SizedBox(
        height: altura,
        width: largura,
        child: TextFormField(
        enabled: editavel,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          LengthLimitingTextInputFormatter(tamanho),
          MaskedTextInputFormatterShifter(
            maskONE: "XX/XX",
            maskTWO: "XX/XX/XXXX", 
          )
        ],
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoParaCPF(altura, editavel, icone, label, controle, tamanho){
 return SizedBox(
        height: altura,
        child: TextFormField(
        enabled: editavel,
        keyboardType: TextInputType.number,
        inputFormatters: [
        LengthLimitingTextInputFormatter(tamanho),
        MaskedTextInputFormatterShifter(
            maskONE: "XXX.XXX.XXX-XX",
            maskTWO: "XX.XXX.XXX/XXXX-XX"
          )
        ],
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoSomenteNumeros(largura, altura, editavel, limiteCaracter, icone, label, controle){
  return SizedBox(
        height: altura,
        width: largura,
        child: TextFormField(
        enabled: editavel,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(limiteCaracter),
          WhitelistingTextInputFormatter.digitsOnly,  
        ],
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoNumerosSemIcone(largura, altura, editavel, limiteCaracter, label, controle){
  return SizedBox(
        height: altura,
        width: largura,
        child: TextFormField(
        enabled: editavel,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(limiteCaracter),
          WhitelistingTextInputFormatter.digitsOnly,  
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoParaEmail(altura, editavel, icone, label, controle){
  return SizedBox(
        height: altura,
        child: TextFormField(
        enabled: editavel,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(icone),
            border: OutlineInputBorder(),
            labelText: label,
        ),
            controller: controle,
        ),
      );
}

textoParaSobre(altura, largura, icone, label){
  return SizedBox(
        height: altura,
        width: largura,
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            prefixIcon: Icon(icone,
                             color: Colors.lightBlue[300],
                             size: 20,
                            ),
            border: OutlineInputBorder(),
            labelText: label,
          ),
        ),
      );
}

class CaixaTextoSenha extends StatefulWidget {
  const CaixaTextoSenha({
     this.controle,
  });

  final TextEditingController controle;
  @override
  _CaixaTextoSenhaState createState() => _CaixaTextoSenhaState();
}

class _CaixaTextoSenhaState extends State<CaixaTextoSenha> {
bool visivel = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: TextFormField(
        obscureText: !visivel,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            suffixIcon: GestureDetector(
              onLongPress: () { 
                setState(() {
                  visivel = true;
                }); 
              },
              onLongPressUp: () {
                setState(() {
                  visivel = false;
                });
              },
              child: Icon(
                  visivel ? Icons.visibility : Icons.visibility_off),
            ),
            border: OutlineInputBorder(),
            labelText: "Senha",
        ),
            controller: widget.controle,
        ),
      );
  }
}


