import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextInputType textInputType;
  final Function validator;
  final TextEditingController textEditingController;
  final bool obscureText;
  final bool enableField;
  final Function(String) onSubmit;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final String Function() stringFunction;
  final Widget prefix;

  const TextFieldWidget({
    Key key,
    this.hintText,
    this.textInputType,
    this.validator,
    this.textEditingController,
    this.obscureText = false,
    this.enableField = true,
    this.onSubmit,
    this.inputFormatters,
    this.maxLines = 1,
    this.labelText,
    this.stringFunction,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textEditingController,
      style: TextStyle(
        fontFamily: 'Montserrat',
        ),
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
        labelStyle: TextStyle(
              fontFamily: 'Montserrat', 
              fontWeight: FontWeight.w500,
              color: Colors.grey
              ),
        errorText: stringFunction == null ? null : stringFunction(),
        labelText: labelText,
        errorStyle: TextStyle(fontFamily: 'Montserrat'),
      ),
      keyboardType: textInputType,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      validator: validator,
      enabled: enableField,
      onFieldSubmitted: onSubmit,
      inputFormatters: inputFormatters,
    );
  }
}
