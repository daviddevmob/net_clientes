import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetFlushBar {
  void showFlushBarInternet(BuildContext context){
    Flushbar(
      icon: Icon(
        CupertinoIcons.wifi_exclamationmark,
        color: Colors.white,
        size: MediaQuery.of(context).size.height * 0.045,
        ),
        backgroundColor: Color.fromARGB(255, 7, 212, 133),
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
            offset: Offset(3,3),
            blurRadius: 2
          )
        ],
        titleText: Text(
                    'Você está sem internet!',
                     style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.w600
                        ),
                    ),
         messageText: Text(
                    'Por favor, verifique sua conexão e tente novamente.',
                    style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontWeight: FontWeight.w300
                                      ),
                                  ),
                    duration: Duration(seconds: 4),
                  )..show(context);
  }
}
