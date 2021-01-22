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
}
