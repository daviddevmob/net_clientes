import 'package:net_cliente/app/shared/models/rest/rest_avaliacao/rest_avaliacao_profile.dart';

abstract class IRestAvaliacaoProfile {
  Stream<RestAvaliacaoProfile> getRestAvaliacaoProfile(int restId);
}