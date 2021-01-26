import 'package:firebase_auth/firebase_auth.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';

abstract class ILogin {
  Future getCurrentCliente();
  Future<String> createCliente(ClienteModel userModel, String password);
  Future<User> loginGoogle();
  Future<User> loginApple();
  Future<String> verificarGoogle();
  Future<String> loginCliente(String email, String password);
  Future<String> attDados(int clienteId, int bairro, String zap, String cpf);
  Future<String> logOut();
}
