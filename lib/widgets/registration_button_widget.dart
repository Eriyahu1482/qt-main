import 'package:flutter/material.dart';

class RegistrationButtonWidget extends StatelessWidget {
  final String buttonName;
  final double buttonRadiusRight;
  final double buttonRadiusLeft;
  final int buttonColor1;
  final int buttonColor2;
  final int buttonColor3;
  final double buttonColor4;
  final int buttonTextColor1;
  final int buttonTextColor2;
  final int buttonTextColor3;
  final double buttonTextColor4;
  final void Function()? onTap;

  const RegistrationButtonWidget({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.buttonRadiusRight,
    required this.buttonRadiusLeft,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.buttonColor3,
    required this.buttonColor4,
    required this.buttonTextColor1,
    required this.buttonTextColor2,
    required this.buttonTextColor3,
    required this.buttonTextColor4,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(buttonRadiusLeft),
            bottomLeft: Radius.circular(buttonRadiusLeft),
            topRight: Radius.circular(buttonRadiusRight),
            bottomRight: Radius.circular(buttonRadiusRight),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(5, 0.5),
            colors: <Color>[
              Color.fromRGBO(buttonColor1, buttonColor2, buttonColor3, buttonColor4),
              const Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Цвет тени
              offset: const Offset(0, 4), // Смещение тени
              blurRadius: 8, // Радиус размытия тени
              spreadRadius: 2, // Радиус растяжения тени
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(buttonTextColor1, buttonTextColor2, buttonTextColor3, buttonTextColor4),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
