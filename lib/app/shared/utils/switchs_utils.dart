class SwitchsUtils {
  String getBairro(int bairro) {
    String bairroCliente;
    switch (bairro) {
      case 1:
        bairroCliente = 'Amador';
        break;
      case 2:
        bairroCliente = 'Autódromo';
        break;
      case 3:
        bairroCliente = 'Cararu';
        break;
      case 4:
        bairroCliente = 'Centro';
        break;
      case 5:
        bairroCliente = 'Cidade Nova';
        break;
      case 6:
        bairroCliente = 'Coaçu';
        break;
      case 7:
        bairroCliente = 'Coité';
        break;
      case 8:
        bairroCliente = 'Encantada';
        break;
      case 9:
        bairroCliente = 'Guaribas';
        break;
      case 10:
        bairroCliente = 'Jabuti';
        break;
      case 11:
        bairroCliente = 'Lagoinha';
        break;
      case 12:
        bairroCliente = 'Mangabeira';
        break;
      case 13:
        bairroCliente = 'Novo Portugal';
        break;
      case 14:
        bairroCliente = 'Olho D’água';
        break;
      case 15:
        bairroCliente = 'Parque Havaí';
        break;
      case 16:
        bairroCliente = 'Pires Façanha';
        break;
      case 17:
        bairroCliente = 'Precabura';
        break;
      case 18:
        bairroCliente = 'Santa Clara';
        break;
      case 19:
        bairroCliente = 'Santo Antônio';
        break;
      case 20:
        bairroCliente = 'Tamatanduba';
        break;
      case 21:
        bairroCliente = 'Timbú';
        break;
      case 22:
        bairroCliente = 'Urucunema';
        break;
      case 23:
        bairroCliente = 'Vereda Tropical';
        break;
      default:
        bairroCliente = 'Não identificado';
        break;
    }

    return bairroCliente.toString();
  }

  String getCategoriaRest(int categ){
    String categoriaEscolhida;
    switch (categ){
      case 1:
        categoriaEscolhida = 'Açaí';
        break;
      case 2:
        categoriaEscolhida = 'Bebidas';
        break;
      case 3:
        categoriaEscolhida = 'Brasileira';
        break;
      case 4:
        categoriaEscolhida = 'Cafeteria';
        break;
      case 5:
        categoriaEscolhida = 'Carnes';
        break;
      case 6:
        categoriaEscolhida = 'Chinesa';
        break;
      case 7:
        categoriaEscolhida = 'Congelados';
        break;
      case 8:
        categoriaEscolhida = 'Conveniência';
        break;
      case 9:
        categoriaEscolhida = 'Doces & Bolos';
        break;
      case 10:
        categoriaEscolhida = 'Frangos';
        break;
      case 11:
        categoriaEscolhida = 'Frutos do Mar';
        break;
      case 12:
        categoriaEscolhida = 'Hambúrguer';
        break;
      case 13:
        categoriaEscolhida = 'Italiana';
        break;
      case 14:
        categoriaEscolhida = 'Japonesa';
        break;
      case 15:
        categoriaEscolhida = 'Lanches';
        break;
      case 16:
        categoriaEscolhida = 'Marmita';
        break;
      case 17:
        categoriaEscolhida = 'Padarias';
        break;
      case 18:
        categoriaEscolhida = 'Panqueca';
        break;
      case 19:
        categoriaEscolhida = 'Pastel';
        break;
      case 20:
        categoriaEscolhida = 'Pizza';
        break;
      case 21:
        categoriaEscolhida = 'Salgados';
        break;
      case 22:
        categoriaEscolhida = 'Saudável';
        break;
      case 23:
        categoriaEscolhida = 'Sopas e Caldos';
        break;
      case 24:
        categoriaEscolhida = 'Sorvete';
        break;
      case 25:
        categoriaEscolhida = 'Tapioca';
        break;
      case 26:
        categoriaEscolhida = 'Vegana';
        break;
      case 27:
        categoriaEscolhida = 'Vegetariana';
        break;
    }

    return categoriaEscolhida.toString();
  }

  String getMetodoPagamento(int metodo) {
    String metodoPagamento;
    switch (metodo) {
      case 0:
        metodoPagamento = 'Dinheiro';
        break;
      case 1:
        metodoPagamento = 'Visa';
        break;
      case 2:
        metodoPagamento = 'American';
        break;
      case 3:
        metodoPagamento = 'Mastercard';
        break;
      case 4:
        metodoPagamento = 'Elo';
        break;
      case 5:
        metodoPagamento = 'Amex';
        break;
      case 6:
        metodoPagamento = 'Sodexo_Ali';
        break;
      case 7:
        metodoPagamento = 'Sodexo_Ref';
        break;
      case 8:
        metodoPagamento = 'Alelo_Ali';
        break;
      case 9:
        metodoPagamento = 'Alelo_Ref';
        break;
      case 10:
        metodoPagamento = 'Ticket_Ali';
        break;
      case 11:
        metodoPagamento = 'Ticket_Res';
        break;
      default:
        metodoPagamento = 'Não identificado';
        break;
    }

    return metodoPagamento.toString();
  }

  String getStatusPedido(int status) {
    String statusPedido;
    switch (status) {
      case 1:
        statusPedido = 'Solicitado';
        break;
      case 2:
        statusPedido = 'Aprovado';
        break;
      case 3:
        statusPedido = 'Enviado';
        break;
      case 4:
        statusPedido = 'Reprovado';
        break;
      case 5:
        statusPedido = 'Entregue';
        break;
      default:
        statusPedido = 'Não Identificado';
        break;
    }

    return statusPedido.toString();
  }

  String getCategoriaLoja(int metodo) {
    String categoriaLoja;
    switch (metodo) {
      case 1:
        categoriaLoja = 'Alimentos e Bebidas';
        break;
      case 2:
        categoriaLoja = 'Automotivo';
        break;
      case 3:
        categoriaLoja = 'Bebês';
        break;
      case 4:
        categoriaLoja = 'Beleza e Cuidados Pessoais';
        break;
      case 5:
        categoriaLoja = 'Casa, Jardim e Limpeza';
        break;
      case 6:
        categoriaLoja = 'Celulares e Comunicação';
        break;
      case 7:
        categoriaLoja = 'Computadores e Informática';
        break;
      case 8:
        categoriaLoja = 'Eletrônicos, TV e Áudio';
        break;
      case 9:
        categoriaLoja = 'Ferramentas e Construção';
        break;
      case 10:
        categoriaLoja = 'Papelaria e Escritório';
        break;
      case 11:
        categoriaLoja = 'Pet Shop';
        break;
      case 12:
        categoriaLoja = 'Roupas, Calçados e Acessórios';
        break;
      default:
        categoriaLoja = 'Não identificado';
        break;
    }
    return categoriaLoja;
  }
}
