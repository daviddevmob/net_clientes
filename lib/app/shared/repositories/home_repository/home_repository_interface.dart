import 'package:net_cliente/app/shared/models/cliente_model.dart';

abstract class IHome {
  Stream<ClienteModel> getCliente(String email);
}
