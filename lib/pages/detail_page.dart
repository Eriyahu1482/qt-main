import 'package:flutter/material.dart';
import 'package:qt/models/lessions_model.dart';

class DetailLessionPage extends StatefulWidget {
  final Lessions lession;

  const DetailLessionPage({super.key, required this.lession});

  @override
  State<DetailLessionPage> createState() => _DetailLessionPageState();
}

class _DetailLessionPageState extends State<DetailLessionPage> {
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
                widget.lession.description1,
                textAlign: TextAlign.center, // Центрируем текст
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.lession.detLessionText1,
              style: const TextStyle(fontSize: 18), // Уменьшил размер шрифта
            ),
          ],
        ),
      ),
    );
  }
}