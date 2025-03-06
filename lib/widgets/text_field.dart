import 'package:flutter/material.dart';
import 'package:qt/widgets/alert_dialog_helper.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsText;
  final TextInputType inputType;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isObsText = false,
      this.inputType = TextInputType.text});

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Введите $hintText';
          }
          if (hintText == 'Актуальный email' && !validateEmail(value)) {
            return 'Введите коректный email';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide:
                BorderSide(color: Color.fromRGBO(69, 86, 186, 1), width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Color.fromRGBO(69, 86, 186, 1), width: 1),
          ),
          hintStyle: const TextStyle(color: Colors.transparent),
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(69, 86, 186, 1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}