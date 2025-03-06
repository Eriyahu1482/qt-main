import 'package:flutter/material.dart';
import 'package:qt/models/people_model.dart';
import 'package:qt/pages/teacher/description_teacher_page.dart';
import 'package:qt/pages/teacher/teacher_profile_page.dart';
import 'package:qt/widgets/small_card_pupil_widget.dart';

class PupilPage extends StatefulWidget {
  static const routeName = '/pupil-page';
  const PupilPage({super.key});

  @override
  _PupilPageState createState() => _PupilPageState();
}

class _PupilPageState extends State<PupilPage> {
  int _selectedIndex = 1; // Индекс выбранной страницы

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
        Navigator.pushReplacementNamed(context, PupilPage.routeName); // Оставляем на этой странице
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
        actions: [
          IconButton(
            icon: Image.asset('assets/bellIcon.png', width: 24, height: 24),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text('Выберите ученика, которого хотите обучать', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(69, 86, 186, 1),)),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: ListView.separated(
                    itemCount: teacherMiniData.length,
                    itemBuilder: (context, index) {
                      return SmallCardWidgetPupil(people: pupilMiniData[index]);
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 15),
                  ),
                ),
              ),
            ),
          ],
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
