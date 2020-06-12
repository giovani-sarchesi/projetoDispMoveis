//Declaração classes
class Viagens{
  var icone;
  final int idViagem;
  final String origem;
  final String destino;
  final String valor;
  final String data;
  final String tipoViagem;
  
  Viagens(this.icone, 
      this.idViagem, 
      this.origem, 
      this.destino, 
      this.valor, 
      this.data,
      this.tipoViagem);  
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
   final String tipo;

   Passagem(this.icone,
            this.idPassagem, 
            this.idPassageiro, 
            this.idViagem,
            this.data,
            this.origem, 
            this.destino, 
            this.valor,
            this.status,
            this.tipo);
}

class Lugares{
  final String nomeCidade;
  var fotoCidade;
  final String local;
  final String descricao;
  var fotoLocal;
  final String local2;
  final String descricao2;
  var fotoLocal2;

  Lugares(this.nomeCidade,
          this.fotoCidade,
          this.local,
          this.descricao,
          this.fotoLocal,
          this.local2,
          this.descricao2,
          this.fotoLocal2
  );
}
