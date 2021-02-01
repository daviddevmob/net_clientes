import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/push_notification/pn_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/flushbar/aviso_flushbar.dart';


StreamSubscription iosSubscription;

class PushNotificationRepository implements IPushNotification{
  
  BuildContext context;
  final FirebaseMessaging fcm = FirebaseMessaging();
  static Future myBackgroundMessageHandler(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    }
  
  @override
  Future<void> configure() async {
    if (Platform.isIOS) {
            iosSubscription = fcm.onIosSettingsRegistered.listen((data) {
                // save the token  OR subscribe to a topic here
            });

            fcm.requestNotificationPermissions(IosNotificationSettings());
        }

   fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        final snackBar = SnackBar(
          
          content: Text(message['body']));     
         return Scaffold.of(context).showSnackBar(snackBar);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        final snackBar = SnackBar(
          
          content: Text(message['body']));     
         return Scaffold.of(context).showSnackBar(snackBar);
      },
      onResume: (Map<String, dynamic> message) async {
        
      },
    );
        print('TOKEN: ${await fcm.getToken()}');
  }

  @override
  Future addClienteUserTopic() async {
   await fcm.subscribeToTopic('cliente');
  }

  @override
  Future<String> getTokenUser() async {
    // ignore: await_only_futures
    String token = '${await fcm.getToken()}';
    return token;
  }




 
}