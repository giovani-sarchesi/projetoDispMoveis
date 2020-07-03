import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/Telas/menuApp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
var db = Firestore.instance;
final String colecao = "Clientes";
var existe;
bool verificaCPF;
bool realizandoLogin = false;

verificaLogin(String senhaDigitada, String cpf){
  if(senhaDigitada.isEmpty || cpf.isEmpty){
    setState(() {
      realizandoLogin = !realizandoLogin;
    });
    return alertInformativo(context, 
                            "Falha no login", 
                            "Informe usuário e senha para logar.",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }

  existe = db.collection(colecao).
           document(cpf).get().
           then((doc) => {
             if(doc.exists){
               verificaSenha(cpf, senhaDigitada)
             }
             else{
               verificaCPF = false
             }
           });

  if(!verificaCPF){
    setState(() {
      realizandoLogin = !realizandoLogin;
    });
    return alertConfirmativo(context, 
                            "Usuário não existe.",
                            "Retorne e confira os dados, caso não tenha cadastro mesmo, cadastre-se.",
                            botaoIrCadastrar(context, new Botao((Icons.person_add), "Cadastrar")),
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }  
}

void verificaSenha(String cpf, String senhaDigitada) async {
  DocumentSnapshot usuarioLoga;
  var senhaUsuario;

  usuarioLoga = await db.collection(colecao).document(cpf).get();

  setState(() {
    senhaUsuario = usuarioLoga.data["senha"];
  });

  if(senhaUsuario != senhaDigitada){
    setState(() {
      realizandoLogin = !realizandoLogin;
    });
    return alertInformativo(context, 
                            "", 
                            "Senha informada é incorreta, tente novamente.",
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }    
     
  
  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuApp(
    idCliente: cpf
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
          textoParaCPF(35.0, true, (Icons.person_pin), "CPF", txtCPF, 14),
          SizedBox(height: 15),
          CaixaTextoSenha(
            controle: txtSenha,
          ),
          SizedBox(height: 15),
          realizandoLogin? 
          Column(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[300]),
                )
              ),
              Text("Verificando login",
                textScaleFactor: 0.75,
                style: TextStyle(
                  color: Colors.lightBlue[300],
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
              ],
          ) :  
          SizedBox(
            height: 30,
            width: 120,
                child: RaisedButton.icon(
                  icon: Icon(Icons.input, size: 15,),
                  onPressed: (){
                    setState(() {
                      realizandoLogin = !realizandoLogin;
                    });
                    verificaLogin(txtSenha.text, txtCPF.text);
                  }, 
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
