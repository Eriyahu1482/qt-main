import 'package:flutter/material.dart';

class VerySmallButtonWidget extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;

  const VerySmallButtonWidget({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(5, 0.5),
            colors: <Color>[
              Color.fromRGBO(69, 86, 186, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15), // Цвет тени
              spreadRadius: 3, // Распространение тени
              blurRadius: 8, // Размытие тени
              offset: const Offset(0, 4), // Смещение тени по оси Y
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
