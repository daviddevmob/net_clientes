import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';

class ImageResources {
  /*   CropAspectRatioPreset.original,
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio5x3,
                      CropAspectRatioPreset.ratio5x4,
                      CropAspectRatioPreset.ratio7x5,
                      CropAspectRatioPreset.ratio16x9 */

  Future<File> getImage(
      {@required ImageSource source,
      @required BuildContext context,
      String title = "Recorte da Imagem"}) async {
    try {
      return await ImagePicker().getImage(source: source).then(
          (pickedFile) async => await ImageCropper.cropImage(
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
                  toolbarTitle: title,
                  toolbarColor: Cores.azul,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true),
              iosUiSettings: IOSUiSettings(
                title: title,
              )));
    } catch (e) {
      return null;
    }
  }

  Future<File> imageOriginMenu(BuildContext context) {
    ImageSource source;
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListTile(
                          leading: new Icon(CupertinoIcons.camera_fill),
                          title: new Text('Câmera'),
                          onTap: () {
                            print("camera");
                            source = ImageSource.camera;
                            Modular.to.pop();
                          }),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListTile(
                        leading: new Icon(Icons.archive),
                        title: new Text('Galeria'),
                        onTap: () {
                          print("galeria");
                          source = ImageSource.gallery;
                          Modular.to.pop();
                        },
                      ),
                    ),
                  ]),
            ),
          );
        }).then((_) async => await getImage(source: source, context: context));
  }

}
