import 'package:flutter/material.dart';
import 'package:qt/models/people_model.dart';
import 'package:qt/widgets/arrow_button_widget.dart';
import 'package:qt/widgets/small_main_button_widget.dart';

class SmallCardWidgetPupil extends StatefulWidget {
  final People people;


  const SmallCardWidgetPupil({
    super.key,
    required this.people,
  });

  @override
  State<SmallCardWidgetPupil> createState() => _SmallCardWidgetPupilState();
}

class _SmallCardWidgetPupilState extends State<SmallCardWidgetPupil> {

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
            height: 180,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 100, height: 100, child: Image.asset(widget.people.peopleUrl)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                      Text(widget.people.peopleName, style: const TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                      Text(widget.people.peoplePhone, style: const TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                      Text(widget.people.peopleYears, style: const TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),   
                      Text(widget.people.peopleEmail, style: const TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),  
                    ],)
                      ],
                    ),
                        const SizedBox(height: 5,),
                      SmallMainButtonWidget(buttonName: 'Выслать приглашение', onTap: (){Navigator.of(context).pop();}),],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.people.peopleName == 'Пупкин Сергей'? _showInvitationDialog : _showInvitationDialog,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.7),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2, 
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 2,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.zero,
                width: 70,
                height: 70,
                child: Image.asset(widget.people.peopleUrl),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5, left: 10
                    ),
                    child: Text(
                      widget.people.peopleName,
                      style: const TextStyle(
                        color: Color.fromRGBO(53, 73, 142, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: ArrowButtonWidget(onTap: () {
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
