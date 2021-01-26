import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';

class AvisoFlushBar {
  void showFlushBarAviso(BuildContext context, String titulo ,String aviso){
    Flushbar(
      icon: Icon(
        CupertinoIcons.info_circle_fill,
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.045,
        ),
        backgroundColor: Cores.verdeLodo,
        borderRadius: 8,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.015
        ),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        boxShadows: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2,2),
            blurRadius: 1
          )
        ],
        titleText: Text(
                      titulo,
                     style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500
                        ),
                    ),
         messageText: Text(
                    aviso,
                    style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                                      ),
                                  ),
                    duration: Duration(seconds: 2),
                  )..show(context);
  }
}
