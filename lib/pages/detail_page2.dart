import 'package:flutter/material.dart';
import 'package:qt/models/lessions_model.dart';

class DetailLessionPage2 extends StatefulWidget {
  final Lessions lession;

  const DetailLessionPage2({super.key, required this.lession});

  @override
  State<DetailLessionPage2> createState() => _DetailLessionPage2State();
}

class _DetailLessionPage2State extends State<DetailLessionPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Добавляем отступы для лучшего вида
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Выравниваем по левому краю
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                widget.lession.description3,
                textAlign: TextAlign.center, // Центрируем текст
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.lession.detLessionText3,
              style: const TextStyle(fontSize: 18), // Уменьшил размер шрифта
            ),
          ],
        ),
      ),
    );
  }
}