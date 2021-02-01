import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/push_notification/pn_repository.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/api_erros/firebase_erros.dart';
import 'package:net_cliente/app/shared/utils/api_erros/hasura_erros_code.dart';

class LoginRepository implements ILogin {
  final HasuraConnect api;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final PushNotificationRepository pn;
  LoginRepository(this.api, this.pn);

  @override
  Future<String> createCliente(ClienteModel userModel, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: "${userModel.email}",
        password: "$password",
      );

      print(userCredential.user.email);
      String tokenUser = await pn.getTokenUser();

      var criarCliente = '''
      mutation MyMutation {
        insert_cliente(
          objects: {
            bairro: ${userModel.bairro}, 
            cpf: "${userModel.cpf}", 
            email: "${userModel.email}", 
            firebase_id: "$tokenUser", 
            nome: "${userModel.nome}", 
            status: true, 
            whatsapp: "${userModel.whatsapp}"
            }) {
          returning {
            cliente_id
          }
        }
      }
      ''';

      var data = await api.mutation(criarCliente);

      // ignore: unused_local_variable
      int clienteId =
          await data['data']['insert_cliente']['returning'][0]['cliente_id'];

      return userCredential.user.email;
    } on FirebaseAuthException catch (e) {
      return getErrorFirebaseString(e.code);
    } on HasuraError catch (e) {
      await FirebaseAuth.instance.currentUser.delete();
      return getErrorHasuraString(e.message);
    } catch (e) {
      return e.toString();
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
    _googleSignIn.signOut();
    var sair = await auth.signOut().then((value) {
      return 'sair';
    });
    print(sair + 'AFFFFAF');
    return sair;
  }

  @override
  Future<String> attDados(
      int clienteId, int bairro, String zap, String cpf) async {
    try {
      var query = '''
        mutation MyMutation {
          update_cliente(
            where: {
              cliente_id: {_eq: $clienteId}},
              _set: {
                cpf: "$cpf", 
                whatsapp: "$zap",
                bairro: $bairro
                }) {
            affected_rows
          }
        }
        ''';

      await api.mutation(query);
      return 'ok';
    } on HasuraError catch (e) {
      return getErrorHasuraString(e.message);
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<User> loginApple() {}

  @override
  Future<User> loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print(googleAuth.accessToken.toString());

      final User user = (await auth.signInWithCredential(credential)).user;
      print("signed in " + user.email);
      return user;
    } catch (e) {
      print('Error $e');
    }
  }

  @override
  Future<String> verificarGoogle() async {
    try {
      User user = await loginGoogle();
      print('FIREBASE ID 1: ' + user.uid);
      var verificarUserGoogle = '''
    query MyQuery {
      cliente(
        where: {
          email: {_eq: "${user.email}"}}) {
        email
      }
    }
    ''';

      var data = await api.query(verificarUserGoogle);
      String tokenUser = await pn.getTokenUser();
      String email = data['data']['cliente'].toString();

      print('EMAIL: ' + email);
      print('FIREBASE ID 2: ' + user.uid);
      if (email == null || email == '' || email == '[]') {
        var criarCliente = '''
      mutation MyMutation {
        insert_cliente(
          objects: {
            email: "${user.email}", 
            nome: "${user.displayName}", 
            firebase_id: "$tokenUser"
            status: true, 
            }) {
          returning {
            cliente_id
          }
        }
      }
      ''';

        print('FIREBASE ID 3 criado: ' + user.uid);

        await api.mutation(criarCliente);

        return user.email;
      } else {
        return user.email;
      }
    } catch (e) {
      return 'erro';
    }
  }
}
