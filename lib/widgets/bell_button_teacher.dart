import 'package:flutter/material.dart';
import 'package:qt/widgets/very_small_button_widget.dart';

class BellButtonTeacherWidget extends StatefulWidget {
  const BellButtonTeacherWidget({
    super.key,
  });

  @override
  State<BellButtonTeacherWidget> createState() => _BellButtonTeacherWidgetState();
}

class _BellButtonTeacherWidgetState extends State<BellButtonTeacherWidget> {
  void _showInvitationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            width: 450,
            height: 225,
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Новое приглашение',
                  style: TextStyle(
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 10),
                      child: SizedBox(
                          width: 89,
                          height: 89,
                          child: Image.asset('assets/teacher1.png')),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'Фролов Николай Иванович',
                            style: TextStyle(
                              color: Color.fromRGBO(53, 73, 142, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '+7(941) 910 30 51',
                            style: TextStyle(
                              color: Color.fromRGBO(53, 73, 142, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Стаж работы: 12 лет',
                            style: TextStyle(
                              color: Color.fromRGBO(53, 73, 142, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'nikolay@gmail.com',
                            style: TextStyle(
                              color: Color.fromRGBO(53, 73, 142, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(width: 23),
                    VerySmallButtonWidget(
                        buttonName: 'Принять',
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                        const SizedBox(width: 15),
                    VerySmallButtonWidget(
                        buttonName: 'Отказать',
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showInvitationDialog,
      child: Image.asset('assets/bellIcon.png', width: 24, height: 24),
    );
  }
}
