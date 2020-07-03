import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aeroporto/Alerts/alerts.dart';
import 'package:projeto_aeroporto/Botoes/botoes.dart';
import 'package:projeto_aeroporto/CaixasTexto/caixasTexto.dart';
import 'package:projeto_aeroporto/Classes/classes.dart';

class Cadastrar extends StatefulWidget {
  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

var db = Firestore.instance;
final String colecao = "Clientes";
bool verificaCPF;
var existe;
bool realizandoCadastro = false;
String mensagemCadastro;


limparCampos(){
  txtCPF.clear();
  txtNome.clear();
  txtEmail.clear();
  txtSenha.clear();
}

verificarCadastro(String cpf, String nome, String email, String senha) async {
  
  if(cpf.isEmpty || nome.isEmpty || email.isEmpty || senha.isEmpty){
    setState(() {
      realizandoCadastro = !realizandoCadastro;
    });
    return alertInformativo(context, 
                            "Algo deu errado... :/", 
                            "Lembre-se, todos os dados são obrigatórios.", 
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  } 

  setState(() {
    mensagemCadastro = "Verificando CPF...";
  });
  existe = await db.collection(colecao).
               document(cpf).get().
               then((doc) => {
                 if(doc.exists){
                   verificaCPF = true
                 }
                 else{
                   verificaCPF = false
                 }
               });

  if(verificaCPF){
    setState(() {
      realizandoCadastro = !realizandoCadastro;
    });
    return alertConfirmativo(context, 
                            "Ops...encontramos um problema :(",
                            "Já existe um usuário cadastrado com esse CPF.", 
                            botaoIrLogin(context, new Botao((Icons.input), "Logar")),
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }

  setState(() {
    mensagemCadastro = "Verificando dados...";
  });
  if(cpf.length < 14){
    setState(() {
      realizandoCadastro = !realizandoCadastro;
    });
    return alertInformativo(context, 
                            "CPF informado é inválido.", 
                            "Informe um CPF válido para realizar o cadastro.", 
                            botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }  
  if(!email.contains('@')) {
    setState(() {
      realizandoCadastro = !realizandoCadastro;
    });
    return alertInformativo(context, 
                           "E-mail informado é inválido!", 
                           "Informe um e-mail válido para realizar o cadastro.", 
                           botaoFecharAlert(context, new Botao((Icons.check_circle), "Voltar")));
  }      

  cadastrar(context, Cliente(cpf, nome, email, senha));
  setState(() {
    realizandoCadastro = !realizandoCadastro;
  });
  alertInformativo(context, 
                  "Cadastro realizado com sucesso!", 
                  "Seja bem-vindo $nome, faça login para aproveitar nosso aplicativo!", 
                  botaoIrLogin(context, new Botao((Icons.check_circle), "Ir ao login.")));
  limparCampos();
}

void cadastrar(BuildContext context, Cliente cliente) async{
  setState(() {
    mensagemCadastro = "Realizando cadastro...";
  });
  await db.collection(colecao).document(cliente.cpf).setData(
    {
      "nome": cliente.nome,
      "email": cliente.email,
      "senha": cliente.senha
    }
  );
}

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCPF = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size.fromHeight(35),
              child: AppBar(
             backgroundColor: Colors.white,
             title: Text("Cadastrar",
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
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              botaoTelaInicial(context, Botao((Icons.chevron_left), "Voltar")),
          ],),          
          Image.asset('assets/imagens/logoGK.png', height: 300, width: 300,),
          textoParaCPF(35.0, true, (Icons.featured_video), "CPF", txtCPF, 14),
          SizedBox(height: 15),
          textoComum(35.0, true, (Icons.mode_edit), "Nome", txtNome),
          SizedBox(height: 15),
          textoParaEmail(35.0, true, (Icons.alternate_email),"E-mail", txtEmail),
          SizedBox(height: 15),
          CaixaTextoSenha(
            controle: txtSenha,
          ),
          SizedBox(height: 15),
          realizandoCadastro? 
          Column(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[300]),
                )
              ),
              Text(mensagemCadastro,
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
              child: RaisedButton.icon(icon: Icon(Icons.person_add, size: 15),
              onPressed: (){
                setState(() {
                  mensagemCadastro = "Verificando campos...";
                  realizandoCadastro = !realizandoCadastro;
                });
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