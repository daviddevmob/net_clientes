import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/produto_rest_controller.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/produto_rest/produto_rest_module.dart';

void main() {
  initModule(ProdutoRestModule());
  // ProdutoRestController produtorest;
  //
  setUp(() {
    //     produtorest = ProdutoRestModule.to.get<ProdutoRestController>();
  });

  group('ProdutoRestController Test', () {
    //   test("First Test", () {
    //     expect(produtorest, isInstanceOf<ProdutoRestController>());
    //   });

    //   test("Set Value", () {
    //     expect(produtorest.value, equals(0));
    //     produtorest.increment();
    //     expect(produtorest.value, equals(1));
    //   });
  });
}
