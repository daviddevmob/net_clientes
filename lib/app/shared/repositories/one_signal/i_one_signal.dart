abstract class IOneSignal{
  Future configure();
  Future registerUserExternalId(String id);
  Future<String> saveIdOneSignal();
}