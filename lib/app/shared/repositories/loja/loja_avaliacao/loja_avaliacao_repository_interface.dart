abstract class ILojaAvaliacao{
  Future addAvaliacao(int clienteId, int lojaId, int pedidoId, double nota, String text);
  Future editAvaliacao(int avaliacaoId, double nota, String text);
}