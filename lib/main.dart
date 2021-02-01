import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:net_cliente/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/push_notification/pn_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationRepository().configure();
  await GetStorage.init();
  runApp(ModularApp(module: AppModule()));
}
