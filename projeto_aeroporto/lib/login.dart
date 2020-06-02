import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/telaInicial.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
void verificaLogin(String senha, String usuario){
  debugPrint(txtUsuario);
  debugPrint(txtSenha);
  if(senha != '12345' && usuario != 'giovani'){
    _showAlertDialog('Dados incorretos...', 'Confira os dados informados.');
  }
  else{
    Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => TelaInicial()));
  }
}

void _showAlertDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            RaisedButton(
              child: Text("OK", style: TextStyle(color: Colors.blueAccent[100]),),
              onPressed: (){ Navigator.of(context).pop(); },
            )
          ],
        );
      }
    );
  }
  
  var txtUsuario = "";
  var txtSenha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[300],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(        
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[          
          Image.asset('assets/imagens/logoGK.png', height: 200, width: 200,),
          SizedBox(
                height: 35,
                child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                  labelText: 'Usuário',
                ),
                onChanged: (text) {txtUsuario = text;},
              ),
          ),
          SizedBox(height: 15),
          SizedBox(
              height: 35,
              child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
              onChanged: (text) {txtSenha = text;},
            ),
          ),
          SizedBox(height: 15),
          FlatButton.icon(
              onPressed: (){verificaLogin(txtSenha, txtUsuario);},
              icon: Icon(Icons.play_for_work,
                         color: Colors.black,), 
              label: Text('Logar'), 
              textColor: Colors.black,
              color: Colors.lightBlue[100])
        ],)
      ),
    );
  }
}