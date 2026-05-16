final listaPedidos = [
  {
    "id_pedido": "REQ-9872",
    "data_criacao": "2026-05-14T10:00:00Z",
    "status": "processando",
    "cliente": {
      "id_cliente": "USR-441",
      "nome": "Ana Silva",
      "email": "ana.silva@email.com",
    },
    "pagamento": {
      "metodo": "cartao_credito",
      "parcelas": 3,
      "confirmado": true,
    },
    "itens": [
      {
        "id_produto": "PROD-001",
        "nome": "Teclado Mecânico RGB",
        "preco_unitario": 349.90,
        "quantidade": 1,
      },

      {
        "id_produto": "PROD-012",
        "nome": "Mouse Pad Extendido",
        "preco_unitario": 89.90,
        "quantidade": 2,
      },
    ],
  },
  {
    "id_pedido": "REQ-9873",
    "data_criacao": "2026-05-14T10:15:00Z",
    "status": "entregue",
    "cliente": {
      "id_cliente": "USR-102",
      "nome": "Carlos Souza",
      "email": "carlos.s@email.com",
    },
    "pagamento": {"metodo": "pix", "parcelas": 1, "confirmado": true},
    "itens": [
      {
        "id_produto": "PROD-055",
        "nome": "Fone de Ouvido Bluetooth",
        "preco_unitario": 199.00,
        "quantidade": 1,
      },
    ],
  },
];

class Produto {
  final String id;
  final String nome;
  final double precoUnitario;
  final int quantidade;

  const Produto({
    required this.id,
    required this.nome,
    required this.precoUnitario,
    required this.quantidade,
  });

  Produto.fromMap(Map<String, dynamic> produtoMap)
    : id = produtoMap['id_produto'],
      nome = produtoMap['nome'],
      precoUnitario = produtoMap['preco_unitario'],
      quantidade = produtoMap['quantidade'];

  @override
  String toString() =>
      "\n\t(ID: $id | Nome: $nome | Preço Unitário: $precoUnitario | Quantidade: $quantidade )";
}

class Pagamento {
  final String metodo;
  final int parcelas;
  final bool confirmado;

  const Pagamento({
    required this.metodo,
    required this.parcelas,
    required this.confirmado,
  });

  Pagamento.fromMap(Map<String, dynamic> pagamentoMap)
    : metodo = pagamentoMap['metodo'],
      parcelas = pagamentoMap['parcelas'],
      confirmado = pagamentoMap['confirmado'];

  @override
  String toString() =>
      "Método: $metodo\n\tParcelas: $parcelas\n\tConfirmado: ${confirmado ? 'Sim' : 'Não'}";
}

class Cliente {
  final String id;
  final String nome;
  final String email;

  const Cliente({required this.id, required this.nome, required this.email});

  Cliente.fromMap(Map<String, dynamic> clienteMap)
    : id = clienteMap['id_cliente'],
      nome = clienteMap['nome'],
      email = clienteMap['email'];

  @override
  String toString() => "ID: $id\n\tNome: $nome\n\tEmail: $email";
}

class Pedido {
  final String id;
  final String dataCriacao;
  final String status;
  final Cliente cliente;
  final Pagamento pagamento;
  final List<Produto> itensPedido;

  const Pedido({
    required this.id,
    required this.dataCriacao,
    required this.status,
    required this.cliente,
    required this.pagamento,
    required this.itensPedido,
  });

  Pedido.fromMap(Map<String, dynamic> pedidoMap)
    : id = pedidoMap['id_pedido'],
      dataCriacao = pedidoMap['data_criacao'],
      status = pedidoMap['status'],
      cliente = Cliente.fromMap(pedidoMap['cliente']),
      pagamento = Pagamento.fromMap(pedidoMap['pagamento']),
      itensPedido = (pedidoMap['itens'] as List)
          .map((item) => Produto.fromMap(item as Map<String, dynamic>))
          .toList();

  @override
  String toString() {
    return "\nID: $id\nCriado em: $dataCriacao\nStatus: $status\nCliente:\n\t$cliente\nPagamento:\n\t$pagamento\nItens: $itensPedido";
  }
}

void main() {
  final List<Pedido> pedidos = listaPedidos
      .map((e) => Pedido.fromMap(e))
      .toList();

  pedidos.forEach(print);
}
