import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_cliente/app/shared/utils/colors.dart';
import 'package:net_cliente/app/shared/utils/text.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final Widget leading;
  final bool viewLeading;
  final List<Widget> actions;

  const AppBarWidget({
    Key key,
    this.leading,
    this.actions,
    this.title,
    this.viewLeading = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Cores.verdeClaro,
      centerTitle: true,
      leading: viewLeading == true 
      ? IconButton(
        icon: Icon(CupertinoIcons.back),
        onPressed: () {
          Navigator.pop(context);
        },
      )
      : null,
      title: TextWidget(
        text: title,
        textColor: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      actions: actions,
    );
  }
}
