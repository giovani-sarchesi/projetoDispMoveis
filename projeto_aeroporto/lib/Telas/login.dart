import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';
import 'package:projeto_aeroporto/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
void verificaLogin(String senha, String cpf){
  if(senha.isEmpty || cpf.isEmpty){
    return alertInformativo(context, 
                            "Falha no login", 
                            "Informe usuário e senha para logar.",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }

  var verificaCPF = clientes.firstWhere((cliente) => cliente.cpf == cpf, 
                                        orElse: () => null);

  if(verificaCPF == null){
    return alertConfirmativo(context, 
                            "Usuário não existe.",
                            "Retorne e confira os dados, caso não tenha cadastro mesmo, cadastre-se.",
                            botaoIrCadastrar(context, new Botao((Icons.person_add), "Cadastrar")),
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }
  if(verificaCPF.senha != senha){
    return alertInformativo(context, 
                            "", 
                            "Senha informada é incorreta.",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }    
     
  
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenuApp(
    idCliente: verificaCPF.id
  )));
  
}

  TextEditingController txtCPF = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(35),
              child: AppBar(
             backgroundColor: Colors.white,
             title: Text("Login",
                textAlign: TextAlign.start, 
                textScaleFactor: 0.75,
                style: TextStyle(
                    color: Colors.lightBlue[300],) ),
          ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[     
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              botaoTelaInicial(context, Botao((Icons.chevron_left), "Voltar")),
          ],),      
          Image.asset('assets/imagens/logoGK.png', height: 300, width: 300,),
          textoParaCPF(35.0, true, (Icons.person_pin), "CPF", txtCPF),
          SizedBox(height: 15),
          CaixaTextoSenha(
            controle: txtSenha,
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 30,
            width: 120,
                child: RaisedButton.icon(
                  icon: Icon(Icons.input, size: 15,),
                  onPressed: (){verificaLogin(txtSenha.text, txtCPF.text);}, 
                  label: Text("Fazer login", textScaleFactor: 0.75,),
                  shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(1000.0),
                  ),
                  color: Colors.lightBlue[300],
            ),
          ),
          ],)
      ),
    );
  }
}
