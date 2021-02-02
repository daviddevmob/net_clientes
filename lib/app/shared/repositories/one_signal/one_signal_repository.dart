import 'package:net_cliente/app/shared/repositories/one_signal/i_one_signal.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalRepository implements IOneSignal{
  @override
  Future configure() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init(
      "3a163606-3e4b-4afb-9342-3bd4e2766ae8",
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: false
      }
    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
  }

  @override
  Future registerUserExternalId(String id) async {
    await OneSignal().getPermissionSubscriptionState();
    await OneSignal().setExternalUserId(id);
    await OneSignal().sendTag('user_type', 'cliente');
    await OneSignal().setSubscription(true);
  }

 

  @override
  Future<String> saveIdOneSignal() async {
    var p = await OneSignal.shared.getPermissionSubscriptionState();
    print(p.subscriptionStatus.userId);
    return p.subscriptionStatus.userId;
  }

}