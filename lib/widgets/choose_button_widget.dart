import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChooseWidgetButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;

  const ChooseWidgetButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1, 1),
            colors: <Color>[
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(106, 122, 212, 1),
              Color.fromRGBO(106, 122, 212, 1),
              Color.fromRGBO(106, 122, 212, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Цвет тени
              offset: const Offset(0, 7), // Смещение тени по оси Y
              blurRadius: 6, // Радиус размытия тени
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
