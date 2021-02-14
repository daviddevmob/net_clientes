abstract class IRestAvaliacao{
  Future editAvaliacao(int clienteId, int restId, int pedidoId, int avaliacaoId, double nota, String text);
  Future saveAvaliacao(int clienteId, int restId, int pedidoId, double nota, String text);
}