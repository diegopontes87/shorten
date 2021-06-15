import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final FocusNode? focus;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextInputAction? textInputAction;

  AppTextFormField({
    this.focus,
    this.inputFormatters,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      cursorColor: Theme.of(context).colorScheme.primary,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
      ),
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}
