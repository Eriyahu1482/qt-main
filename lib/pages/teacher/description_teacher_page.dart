import 'package:flutter/material.dart';
import 'package:qt/pages/pupil/choose_page.dart';
import 'package:qt/pages/teacher/choose_teacher_page.dart';
import 'package:qt/pages/teacher/teacher_profile_page.dart';
import 'package:qt/widgets/bell_button_widget.dart';
import 'package:qt/widgets/small_main_button_widget.dart';

class DescriptionTeacherPage extends StatefulWidget {
  static const routeName = '/descriptionteacher-page';
  const DescriptionTeacherPage({super.key});

  @override
  _DescriptionTeacherPageState createState() => _DescriptionTeacherPageState();
}

class _DescriptionTeacherPageState extends State<DescriptionTeacherPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Не делаем ничего, если нажата текущая иконка

    setState(() {
      _selectedIndex = index;
    });

    // Навигация к соответствующим страницам
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacementNamed(context, ChooseTeacherPage.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ProfileTeacherPage.routeName);
        break;
    }
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: BellButtonWidget(),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    'Курс "Программирование с помощью фреймворка Qt"',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(53, 73, 142, 1),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Qt - кроссплатформенный фреймворк для создания графических приложений для десктопа, мобильных и встроенных устройств.',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 235),
                child: Text(
                  'Цель курса',
                  style: TextStyle(
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Наша цель - научить вам пользоваться данным фреймворком. За время прохождения курса вы познаете все его тонкости и сделаете свои первые работы для портфолио!',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 235),
                child: Text(
                  'Как начать?',
                  style: TextStyle(
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Чтобы начать прохождение данного курса, вам нужно перейти на вкладку курса, выбрать наставника и в скором времени вам позвонит наставник, чтобы договориться о дате и времени занятия. Ученик и преподаватель самостоятельно договариваются о том, как будут проходить уроки.',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child: SmallMainButtonWidget(
                  buttonName: 'Перейти к курсу',
                  onTap: () {
                    Navigator.of(context).pushNamed(ChoosePage.routeName);
                  },
                ),
              ),
            const SizedBox(height: 70,)
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
      icon: Image.asset(
        _selectedIndex == index ? selectedIcon : defaultIcon,
        width: 24,
        height: 24,
      ),
      label: '', // Убираем текст
    );
  }
}
