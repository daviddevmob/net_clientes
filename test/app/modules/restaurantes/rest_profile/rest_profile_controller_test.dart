import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:net_cliente/app/modules/restaurantes/rest_profile/rest_profile_controller.dart';
import 'package:net_cliente/app/modules/restaurantes/rest_profile/rest_profile_module.dart';

void main() {
  initModule(RestProfileModule());
  // RestProfileController restprofile;
  //
  setUp(() {
    //     restprofile = RestProfileModule.to.get<RestProfileController>();
  });

  group('RestProfileController Test', () {
    //   test("First Test", () {
    //     expect(restprofile, isInstanceOf<RestProfileController>());
    //   });

    //   test("Set Value", () {
    //     expect(restprofile.value, equals(0));
    //     restprofile.increment();
    //     expect(restprofile.value, equals(1));
    //   });
  });
}
