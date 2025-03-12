// В файле text_field.dart
import 'package:flutter/material.dart';
import 'package:qt/widgets/alert_dialog_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsText;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObsText = false,
    this.inputType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(69, 86, 186, 1),
        ),
        cursorColor: const Color.fromRGBO(69, 86, 186, 1),
        controller: controller,
        obscureText: isObsText,
        keyboardType: inputType,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(69, 86, 186, 1),
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color.fromRGBO(69, 86, 186, 1),
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          // Красный текст ошибки
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: const TextStyle(color: Colors.transparent),
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(69, 86, 186, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}