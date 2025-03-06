import 'package:flutter/material.dart';

class ArrowButtonWidget extends StatelessWidget {
  final void Function()? onTap;

  const ArrowButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios,
              color: Color.fromRGBO(53, 73, 142, 1),
            ),
          ],
        ),
      ),
    );
  }
}