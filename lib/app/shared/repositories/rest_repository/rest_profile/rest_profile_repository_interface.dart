import 'package:net_cliente/app/shared/models/rest/pedido_rest_model/pedido_rest_model.dart';
import 'package:net_cliente/app/shared/models/rest/produto_view/rest_produto_profile.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';

abstract class IRestProfile {
  Future<RestProfile> getRest(int restId);
  Future<bool> veridicaQuantidadeProduto(int produtoId, int quantidade);
  Future addProdutoCarrinho(
    int clienteId, 
    int restId, 
    int produtoId, 
    double preco, 
    double total,
    int quantidade, 
    String  complementos,
    String opcoes,
    String clienteFirebaseId,
    );
  Future<RestProdutoProfile> getProdutoView(int produtoId, int categoriaId);
  Future<String> fazerPedido(PedidoRestModel pedidoRestModel);
}