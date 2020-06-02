import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';
import 'package:projeto_aeroporto/main.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

limparCampos(){
  txtCPF.clear();
  txtNome.clear();
  txtEmail.clear();
  txtSenha.clear();
}
verificarCadastro(String cpf, String nome, String email, String senha){
  var verificaCPF = clientes.firstWhere((cliente) => cliente.cpf == cpf, 
                                        orElse: () => null);
  if(cpf.isEmpty || nome.isEmpty || email.isEmpty || senha.isEmpty){
    return alertInformativo(context, 
                            "Algo deu errado... :/", 
                            "Lembre-se, todos os dados são obrigatórios.", 
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  } 
  if(verificaCPF != null){
    return alertConfirmativo(context, 
                            "Ops...encontramos um problema :(",
                            "Já existe um usuário cadastrado com esse CPF.", 
                            botaoIrLogin(context, new Botao((Icons.input), "Logar")),
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }
  if(cpf.length < 11){
    return alertInformativo(context, 
                            "CPF informado é inválido.", 
                            "Informe um CPF válido para realizar o cadastro.", 
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }  
  if(!email.contains('@')) {
    return alertInformativo(context, 
                           "E-mail informado é inválido!", 
                           "Informe um e-mail válido para realizar o cadastro.", 
                           botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }      

  clientes.add(Cliente(clientes.length + 1, cpf, nome, email, senha));
  alertInformativo(context, 
                  "Cadastro realizado com sucesso!", 
                  "Seja bem-vindo $nome, faça login para aproveitar nosso aplicativo!", 
                  botaoIrLogin(context, new Botao((Icons.check_circle), "Ir ao login.")));
  limparCampos();
}

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCPF = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              botaoTelaInicial(context, Botao((Icons.chevron_left), "Voltar")),
          ],),          
          Image.asset('assets/imagens/logoGK.png', height: 300, width: 300,),
          textoParaCPF(35.0, true, (Icons.featured_video), "CPF", txtCPF),
          SizedBox(height: 15),
          textoComum(35.0, true, (Icons.mode_edit), "Nome", txtNome),
          SizedBox(height: 15),
          textoParaEmail(35.0, true, (Icons.alternate_email),"E-mail", txtEmail),
          SizedBox(height: 15),
          CaixaTextoSenha(
            controle: txtSenha,
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 30,
            width: 120,
              child: RaisedButton.icon(icon: Icon(Icons.person_add, size: 15),
              onPressed: (){
                verificarCadastro(txtCPF.text, txtNome.text, txtEmail.text, txtSenha.text);
              }, 
              label: Text("Cadastrar", textScaleFactor: 0.75,),
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