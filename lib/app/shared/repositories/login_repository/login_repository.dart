import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/api_erros/firebase_erros.dart';

class LoginRepository implements ILogin {
  final HasuraConnect api;
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginRepository(this.api);

  @override
  Future<String> createCliente(ClienteModel userModel, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: "${userModel.email}",
        password: "$password",
      );

      print(userCredential.user.email);

      var criarCliente = '''
      mutation MyMutation {
        insert_cliente(
          objects: {
            bairro: "", 
            cpf: "", 
            email: "", 
            firebase_id: "", 
            nome: "", 
            status: true, 
            whatsapp: ""
            }) {
          returning {
            cliente_id
          }
        }
      }
      ''';


      var data = await api.mutation(criarCliente);

      // ignore: unused_local_variable
      int clienteId = await data['data']['insert_cliente']['returning'][0]['cliente_id'];

      return userCredential.user.email;
    } on FirebaseAuthException catch (e) {
      return getErrorFirebaseString(e.code);
    } on HasuraError catch (e) {
      await FirebaseAuth.instance.currentUser.delete();
      return e.message;
    } catch (e) {
      return e;
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  Future<ClienteModel> getCliente(String email) async {
    var query = '''
    query MyQuery {
      cliente(where: {email: {_eq: "$email"}}) {
        bairro
        cliente_id
        cpf
        email
        nome
        firebase_id
        status
        whatsapp
      }
    }
    ''';
    var data = await api.query(query);
    var result = await data['data']['cliente'][0];
    return ClienteModel.fromJson(result);
  }

  @override
  Future<String> loginCliente(String email, String password) async {
    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user.email;
    } on FirebaseAuthException catch (e) {
      return getErrorFirebaseString(e.code);
    }
  }

  @override
  Future getCurrentCliente() async {
    var user = auth.currentUser;
    if (user == null) {
      return 'login';
    }

    return user.email;
  }

  @override
  Future<String> logOut() async {
    var sair = await auth.signOut().then((value) {
      return 'sair';
    });
    print(sair + 'AFFFFAF');
    return sair;
  }
}
