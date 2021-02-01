abstract class IPushNotification{
 Future<void> configure();
 Future addClienteUserTopic();
 Future<String> getTokenUser();
}