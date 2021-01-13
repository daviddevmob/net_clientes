import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:net_cliente/app/shared/models/cliente_model.dart';
import 'package:net_cliente/app/shared/repositories/home_repository/home_repository_interface.dart';
import 'package:net_cliente/app/shared/repositories/login_repository/login_repository_interface.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';

part 'configuracoes_controller.g.dart';

@Injectable()
class ConfiguracoesController = _ConfiguracoesControllerBase
    with _$ConfiguracoesController;

abstract class _ConfiguracoesControllerBase with Store {
  final IHome iHome;
  final ILogin iLogin;
  final picker = ImagePicker();

  _ConfiguracoesControllerBase(this.iHome, this.iLogin);

  @observable
  File imageProfile;

  @observable
  ObservableStream<ClienteModel> cliente;

  @observable
  bool testeImagem = false;

  @observable
  int clienteId;

  @action
  getCliente(String email) async {
    // ignore: await_only_futures
    cliente = await iHome.getCliente(email).asObservable();
  }

  @action
  updateImageProfile() async {
    try {
      final pickedFile = await picker
          .getImage(source: ImageSource.gallery)
          .then((pickedFile) async => await ImageCropper.cropImage(
              sourcePath: pickedFile.path,
              aspectRatioPresets: Platform.isAndroid
                  ? [
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.original,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio16x9
                    ]
                  : [
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.original,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio5x3,
                      CropAspectRatioPreset.ratio5x4,
                      CropAspectRatioPreset.ratio7x5,
                      CropAspectRatioPreset.ratio16x9
                    ],
              androidUiSettings: AndroidUiSettings(
                  toolbarTitle: 'Titulo Imagem',
                  toolbarColor: Cores.azul,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true),
              iosUiSettings: IOSUiSettings(
                title: 'Titulo',
              )));
      imageProfile = pickedFile;
      testeImagem = true;
      await saveImageProfile(imageProfile, clienteId);
      testeImagem = false;
    } catch (e) {
      print(e);
      testeImagem = false;
    }
  }

  @action
  saveImageProfile(File imageProfile, int clienteId) async {
    var saveImage = await iHome.updateFotoPerfil(imageProfile, clienteId);
    return saveImage;
  }

  @action
  sairConta() async {
    var sair = await iLogin.logOut();
    if (sair == 'sair') {
      Modular.to.pop();
      Modular.to.pushReplacementNamed('/login');
    }
  }
}
