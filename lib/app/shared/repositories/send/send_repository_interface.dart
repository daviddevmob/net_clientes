abstract class ISend {
  Future sendWhats(String numero);
  Future sendInstagram(String user);
  Future sendEmail(String email);
  Future sendLigacao(String numero);
  Future editWhats(String numero, int ongId);
  Future editInstagram(String user, int ongId);
  Future editEmail(String email, int ongId);
  Future editLigacao(String numero, int ongId);
  Future deleteWhats(int ongId);
  Future deleteInstagram(int ongId);
  Future deleteEmail(int ongId);
  Future deleteLigacao(int ongId);
  Future<String> updateSocialLinks(
    int socialId,
    String whatsApp,
    String instagram,
    String email,
    String telefone,
  );
  Future<String> insertSocialLinks(
    int userId,
    String whatsApp,
    String instagram,
    String email,
    String telefone
  );
}
