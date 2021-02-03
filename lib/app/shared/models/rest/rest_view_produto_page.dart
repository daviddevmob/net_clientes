import 'package:net_cliente/app/modules/restaurantes/rest_profile/rest_profile_controller.dart';
import 'package:net_cliente/app/shared/models/rest/rest_profile_page.dart';

class RestViewProduto {
  final RestProduto produto;
  final List<RestAdicional> adicional;
  final RestProfileController controller;

  RestViewProduto(this.produto, this.controller, this.adicional);
}
