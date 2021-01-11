import 'package:net_cliente/app/shared/models/cliente_model.dart';

abstract class ILogin {
  Future getCurrentCliente();
  Future<String> createCliente(ClienteModel userModel, String password);
  Future<String> loginCliente(String email, String password);
  Future<String> logOut();
}
