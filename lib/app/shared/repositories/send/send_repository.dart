import 'package:hasura_connect/hasura_connect.dart';
import 'package:net_cliente/app/shared/repositories/send/send_repository_interface.dart';
import 'package:url_launcher/url_launcher.dart';

class SendRepository implements ISend {
  final HasuraConnect api;

  SendRepository(this.api);

  @override
  Future sendInstagram(String user) async {
    String instagram = 'https://www.instagram.com/$user/'
        .replaceAll('@', '')
        .replaceAll(' ', '');
    if (await canLaunch(instagram)) {
      await launch(instagram);
    } else {
      throw 'Could not launch $instagram';
    }
  }

  @override
  Future sendWhats(String numero) async {
    String contato = '55' + numero
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', '')
            .replaceAll(' ', '');
    String whats =
        'https://api.whatsapp.com/send?phone=$contato&text=Ol%C3%A1%2C';
    if (await canLaunch(whats)) {
      await launch(whats);
    } else {
      throw 'Could not launch $whats';
    }
  }

  @override
  Future sendEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email.replaceAll(' ', ''),
      query: 'subject=Oi, &body=Meu nome é', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Future sendLigacao(String numero) async {
    String ligacao = 'tel:' + numero
    .replaceAll('(', '')
    .replaceAll(')', '')
    .replaceAll('-', '')
    .replaceAll(' ', '');
    if (await canLaunch(ligacao)) {
      await launch(ligacao);
    } else {
      throw '$ligacao';
    }
  }

  @override
  Future deleteEmail(int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(
        where: {ong_id: {_eq: $ongId}}, 
        _set: {ong_email: null}) {
        affected_rows
      }
    }
      ''';

    await api.mutation(query);
  }

  @override
  Future deleteInstagram(int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(
        where: {ong_id: {_eq: $ongId}}, 
        _set: {ong_instagram_link: null}) {
        affected_rows
      }
    }
      ''';

    await api.mutation(query);
  }

  @override
  Future deleteLigacao(int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(
        where: {ong_id: {_eq: $ongId}}, 
        _set: {ong_telefone: null}) {
        affected_rows
      }
    }
      ''';

    await api.mutation(query);
  }

  @override
  Future deleteWhats(int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(
        where: {ong_id: {_eq: $ongId}}, 
        _set: {ong_whastapp_link: null}) {
        affected_rows
      }
    }
      ''';

    await api.mutation(query);
  }

  @override
  Future editEmail(String email, int ongId) async {
    var query = '''
      mutation MyMutation {
        update_ong_geral(
          where: {ong_id: {_eq: $ongId}}, 
          _set: {ong_email: "$email"}) {
          affected_rows
        }
      }
        ''';

    await api.mutation(query);
  }

  @override
  Future editInstagram(String user, int ongId) async {
    var query = '''
        mutation MyMutation {
          update_ong_geral(
            where: {ong_id: {_eq: $ongId}}, 
            _set: {ong_instagram_link: "$user"}) {
            affected_rows
          }
        }
      ''';

    await api.mutation(query);
  }

  @override
  Future editLigacao(String numero, int ongId) async {
    var query = '''
      mutation MyMutation {
        update_ong_geral(
          where: {ong_id: {_eq: $ongId}}, 
          _set: {ong_telefone: "$numero"}) {
          affected_rows
        }
      }
        ''';

    await api.mutation(query);
  }

  @override
  Future editWhats(String numero, int ongId) async {
    var query = '''
    mutation MyMutation {
      update_ong_geral(
        where: {ong_id: {_eq: $ongId}}, 
        _set: {ong_whastapp_link: "$numero"}) {
        affected_rows
      }
    }
      ''';

    await api.mutation(query);
  }

  @override
  Future<String> updateSocialLinks(int socialId, String whatsApp,
      String instagram, String email, String telefone) async {
    
    try {
      var query = '''
        mutation MyMutation {
        update_social_links(
          where: {social_id: {_eq: $socialId}},
          _set: {
            email: "$email", 
            instagram: "$instagram", 
            telefone: "$telefone", 
            whatsapp: "$whatsApp"
            }) {
          returning {
            instagram
          }
        }
      }
    ''';
      await api.mutation(query);
      return 'ok';
    } catch (e) {
      return 'erro';
    }
  }

  @override
  Future<String> insertSocialLinks(int userId, String whatsApp,
      String instagram, String email, String telefone) async {
    try {
      var query = '''
        mutation MyMutation {
      insert_social_links(
        objects: {
          email: "$email", 
          instagram: "$instagram", 
          telefone: "$telefone", 
          user_id: $userId, 
          whatsapp: "$whatsApp"
          }) {
        returning {
          email
        }
      }
    }
    ''';

      await api.mutation(query);
      return 'ok';
    } catch (e) {
      return 'erro';
    }
  }
}
