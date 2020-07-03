//Declaração classes
class Viagens{
  String _idViagem;
  String _origem;
  String _destino;
  String _valor;
  int _qtdePassagem;
  String _data;
  String _tipoViagem;
  
  Viagens(this._idViagem, 
      this._origem, 
      this._destino, 
      this._valor, 
      this._qtdePassagem,
      this._data,
      this._tipoViagem); 

  String get id => _idViagem;
  String get origem => _origem;
  String get destino => _destino;
  String get valor => _valor;
  int get qtdePassagem => _qtdePassagem;
  String get data => _data;
  String get tipoViagem => _tipoViagem;

  Viagens.map(dynamic obj){
    this._idViagem = obj['id'];
    this._origem = obj['origem'];
    this._destino = obj['destino'];
    this._valor = obj['valor'];
    this._qtdePassagem = obj['qtdePassagem'];
    this._data = obj['data'];
    this._tipoViagem = obj['tipoViagem'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_idViagem != null){
      map['id'] = _idViagem;
    }
    map['origem'] = origem;
    map['destino'] = destino;
    map['valor'] = valor;
    map['qtdePassagem'] = qtdePassagem;
    map['data'] = data;
    map['tipoViagem'] = tipoViagem;
    return map; 
  }

  Viagens.fromMap(Map<String, dynamic> map, String id){
    this._idViagem = id?? "";
    this._origem = map['origem'];
    this._destino = map['destino'];
    this._valor = map['valor'];
    this._qtdePassagem = map['qtdePassagem'];
    this._data = map['data'];
    this._tipoViagem = map['tipoViagem'];
  }
}

class Cliente{
  String _cpf;
  String _nome;
  String _email;
  String _senha;

  Cliente(this._cpf, 
          this._nome, 
          this._email, 
          this._senha);

  String get cpf => _cpf;
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;

  Cliente.map(dynamic obj){
    this._cpf = obj["cpf"]; 
    this._nome = obj["nome"]; 
    this._email = obj["email"]; 
    this._senha = obj["senha"]; 
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_cpf != null){
      map["cpf"] = _cpf;
    }
    map["nome"] = _nome;
    map["email"] = _email;
    map["senha"] = _senha;
    return map;
  }

  Cliente.fromMap(Map<String,dynamic> map, String cpf){
    this._cpf = cpf ?? "";
    this._nome = map["nome"]; 
    this._email = map["email"]; 
    this._senha = map["senha"]; 
  }

}

class Botao{
  var icone;
  final String label;

  Botao(this.icone, 
        this.label);
}

class Passagem{
   String _idPassagem;
   String _idCliente;
   String _idViagem;
   String _data;
   String _origem;
   String _destino;
   String _valor;
   String _status;
   String _tipo;

   Passagem(this._idPassagem, 
            this._idCliente, 
            this._idViagem,
            this._data,
            this._origem, 
            this._destino, 
            this._valor,
            this._status,
            this._tipo);
    
  String get idPassagem => _idPassagem;
  String get idCliente => _idCliente;
  String get idViagem => _idViagem;
  String get data => _data;
  String get origem => _origem;
  String get destino => _destino;
  String get valor => _valor;
  String get status => _status;
  String get tipo => _tipo;

  Passagem.map(dynamic obj){
    this._idPassagem = obj["idPassagem"];
    this._idCliente = obj["idCliente"];
    this._idViagem = obj["idViagem"];
    this._data = obj["data"];
    this._origem = obj["origem"];
    this._destino = obj["destino"]; 
    this._valor = obj["valor"];
    this._status = obj["status"];
    this._tipo = obj["tipo"];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_idPassagem != null){
      map["idPassagem"] = _idPassagem;
    }
    map["idCliente"] = _idCliente;
    map["idViagem"] = _idViagem;
    map["data"] = _data;
    map["origem"] = _origem;
    map["destino"] = _destino;
    map["valor"] = _valor;
    map["status"] = _status;
    map["tipo"] = _tipo;
    return map;
  }

  Passagem.fromMap(Map<String, dynamic> map, String idPassagem){
    this._idPassagem = idPassagem ?? "";
    this._idCliente = map["idCliente"]; 
    this._idViagem = map["idViagem"];
    this._data = map["data"];
    this._origem = map["origem"];
    this._destino = map["destino"];
    this._valor = map["valor"];
    this._status = map["status"];
    this._tipo = map["tipo"];
  }
}
