import 'package:flutter/material.dart';
import 'package:qt/pages/progress_menu_page.dart';
import 'package:qt/pages/teacher/description_teacher_page.dart';
import 'package:qt/pages/teacher/pupil_page.dart';
import 'package:qt/pages/teacher/teacher_profile_page.dart';
import 'package:qt/widgets/choose_button_widget.dart';
import 'package:qt/widgets/small_main_button_widget.dart';

class ChooseTeacherPage extends StatefulWidget {
  static const routeName = '/chooseteacher-page';
  const ChooseTeacherPage({super.key});

  @override
  _ChooseTeacherPageState createState() => _ChooseTeacherPageState();
}

class _ChooseTeacherPageState extends State<ChooseTeacherPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Не делаем ничего, если нажата текущая иконка

    setState(() {
      _selectedIndex = index;
    });

    // Навигация к соответствующим страницам
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DescriptionTeacherPage.routeName);
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ProfileTeacherPage.routeName);
        break;
    }
  }
  
  void _showInvitationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _controller = TextEditingController();

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width, // Растягиваем на всю ширину
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Вы можете дать данный код-приглашение ученику, которого хотите учить',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(69, 86, 186, 1),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Color.fromRGBO(69, 86, 186, 1)),
                    labelStyle: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(69, 86, 186, 1),
              fontWeight: FontWeight.w500),
                    hintText: 'Код приглашения',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(69, 86, 186, 1), width: 1), // Синий цвет обводки
                    ),
                    focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Color.fromRGBO(69, 86, 186, 1), width: 1),
          ),
                    enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide:
                BorderSide(color: Color.fromRGBO(69, 86, 186, 1), width: 1),
          ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(69, 86, 186, 1),
              fontWeight: FontWeight.w500), // Уменьшаем размер текста в поле
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallMainButtonWidget(buttonName: 'Закрыть', onTap: (){Navigator.of(context).pop();})
              ]),
                  ],
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Center(
            child: Image.asset('assets/logo.png', height: 40), 
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/bellIcon.png', width: 24, height: 24),
            onPressed: () {
              
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 750,
          decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 170),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'Прогресс прохождения курса',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(53, 73, 142, 1),
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'На данный момент у вас действующих учеников, чтобы отслеживать прогресс курса.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ChooseWidgetButton(
                  buttonName: 'Выбрать ученика',
                  onTap: () {
                    Navigator.of(context).pushNamed(PupilPage.routeName);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ChooseWidgetButton(
                  buttonName: 'Код-приглашение',
                  onTap: _showInvitationDialog,
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: ChooseWidgetButton(
                  buttonName: 'Перейти к курсам',
                  onTap: (){
                    Navigator.of(context).pushNamed(ProgressMenuPage.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            items: [
              _buildBottomNavigationBarItem(0, 'assets/home.png', 'assets/home_selected.png'),
              _buildBottomNavigationBarItem(1, 'assets/course.png', 'assets/course_selected.png'),
              _buildBottomNavigationBarItem(2, 'assets/profile.png', 'assets/profile_selected.png'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
          // Квадрат под каждой иконкой
          for (int i = 0; i < 3; i++)
            Positioned(
              bottom: 15,
              left: MediaQuery.of(context).size.width / 3 * i + 24,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                width: 80,
                height: 70,
                decoration: BoxDecoration(
                  color: _selectedIndex == i ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => _onItemTapped(i),
                      child: AnimatedScale(
                        scale: _selectedIndex == i ? 1.3 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Image.asset(
                          _selectedIndex == i 
                              ? '${i == 0 ? 'assets/home_selected.png' : i == 1 ? 'assets/course_selected.png' : 'assets/profile_selected.png'}' 
                              : '${i == 0 ? 'assets/home.png' : i == 1 ? 'assets/course.png' : 'assets/profile.png'}',
                          width: 30,
                          height: 30,
                          color: _selectedIndex == i ? null : Colors.transparent, // Скрываем неактивные иконки
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(int index, String defaultIcon, String selectedIcon) {
    return BottomNavigationBarItem(
      icon: _buildImageIcon(_selectedIndex == index ? selectedIcon : defaultIcon),
      label: '', // Убираем текст
    );
  }

  Widget _buildImageIcon(String path) {
    return Image.asset(
      path,
      width: 24,
      height: 24,
    );
  }
}
