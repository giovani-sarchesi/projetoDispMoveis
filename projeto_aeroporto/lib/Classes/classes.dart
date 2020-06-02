//Declaração classesssss
class Voo{
  var icone;
  final int nroVoo;
  final String origem;
  final String destino;
  final String valor;
  final String data;


  Voo(this.icone, 
      this.nroVoo, 
      this.origem, 
      this.destino, 
      this.valor, 
      this.data);  
}

class Onibus{
  var icone;
  final int nroViagem;
  final String origem;
  final String destino;
  final String valor;
  final String data;


  Onibus(this.icone, 
         this.nroViagem, 
         this.origem, 
         this.destino, 
         this.valor, 
         this.data);
}

class Cruzeiros{
  var icone;
  final int nroCruzeiro;
  final String origem;
  final String destino;
  final String valor;
  final String data;


  Cruzeiros(this.icone, 
            this.nroCruzeiro, 
            this.origem, 
            this.destino, 
            this.valor, 
            this.data);
}

class Cliente{
  final int id;
  final String cpf;
  final String nomeCompleto;
  final String email;
  final String senha;

  Cliente(this.id, 
          this.cpf, 
          this.nomeCompleto, 
          this.email, 
          this.senha);
}

class Botao{
  var icone;
  final String label;

  Botao(this.icone, 
        this.label);
}

class Passagem{
   var icone;
   final int idPassagem;
   final int idPassageiro;
   final int idViagem;
   final String data;
   final String origem;
   final String destino;
   final String valor;
   final String status;

   Passagem(this.icone,
            this.idPassagem, 
            this.idPassageiro, 
            this.idViagem,
            this.data,
            this.origem, 
            this.destino, 
            this.valor,
            this.status);
}

