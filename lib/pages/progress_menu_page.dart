import 'package:flutter/material.dart';
import 'package:qt/models/lessions_model.dart';
import 'package:qt/pages/detail_page.dart';
import 'package:qt/pages/detail_page1.dart';
import 'package:qt/pages/detail_page2.dart';
import 'package:qt/pages/detail_page3.dart';
import 'package:qt/pages/pupil/description_page.dart';
import 'package:qt/pages/pupil/profile_page.dart';

class ProgressMenuPage extends StatefulWidget {
  static const routeName = '/prog-page';

  const ProgressMenuPage({super.key});

  @override
  _ProgressMenuPageState createState() => _ProgressMenuPageState();
}

class _ProgressMenuPageState extends State<ProgressMenuPage> {
  String? selectedSubsection;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DescriptionPage.routeName);
        break;
      case 1:
        // Navigator.pushReplacementNamed(context, CourseProgressPage.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, ProfilePage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double progressValue = 0.05;

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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Прогресс прохождения курса.',
                  style: TextStyle(
                    color: Color.fromRGBO(53, 73, 142, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Наставник: Иванов Иван Иванович',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(11, 29, 91, 1)),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '5%',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 92, 203, 1),
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // Заполненная часть линии
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 3,
                      width: 290 * progressValue,
                      color: const Color.fromRGBO(143, 140, 224, 1),
                    ),
                    Positioned(
                      left: (290 * progressValue) -
                          15, // Корректируем позицию для центрирования
                      child: Container(
                        height: 18, // Увеличиваем высоту ползунка
                        width: 18, // Увеличиваем ширину ползунка
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(143, 140, 224, 1),
                          borderRadius: BorderRadius.circular(
                              4), // Сlightly rounded corners (необязательно)
                        ),
                      ),
                    ),
                    // Фоновая линия
                    Container(
                      height: 3,
                      width: 320,
                      color: const Color.fromRGBO(143, 140, 224, 0.5),
                    ),
                  ],
                ),
                // Квадратный ползунок

                const SizedBox(height: 20),
                const Text(
                  'Занятия',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(11, 29, 91, 1)),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: lessionData.length,
                    itemBuilder: (context, index) {
                      var lession = lessionData[index];
                      return Card(
                          color: const Color.fromRGBO(248, 255, 255, 1),
                          elevation: 4,
                          margin:
                              const EdgeInsets.only(right: 8.0, bottom: 8.0),
                          child: ExpansionTile(
                              title: Text(
                                lession.lessionName,
                                style: const TextStyle(
                                  color: Color.fromRGBO(96, 92, 203, 1),
                                ),
                              ),
                              childrenPadding: EdgeInsets.zero,
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_right, color: Color.fromRGBO(96, 92, 203, 1),),
                                          GestureDetector(
                                            child: Text(
                                              lession.description1,
                                              style: const TextStyle(
                                              fontSize: 16,
                                                color: Color.fromRGBO(96, 92, 203, 1),
                                              ),
                                            ),
                                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailLessionPage(lession: lession)));
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_right, color: Color.fromRGBO(96, 92, 203, 1),),
                                          GestureDetector(
                                            child: Text(
                                              lession.description2,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(96, 92, 203, 1),
                                              ),
                                            ),
                                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailLessionPage1(lession: lession)));
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_right, color: Color.fromRGBO(96, 92, 203, 1),),
                                          GestureDetector(
                                            child: Text(
                                              lession.description3,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(96, 92, 203, 1),
                                              ),
                                            ),
                                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailLessionPage2(lession: lession)));
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          const Icon(Icons.arrow_right, color: Color.fromRGBO(96, 92, 203, 1),),
                                          GestureDetector(
                                            child: Text(
                                              lession.description4,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(96, 92, 203, 1),
                                              ),
                                            ),
                                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailLessionPage3(lession: lession)));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            items: [
              _buildBottomNavigationBarItem(
                  0, 'assets/home.png', 'assets/home_selected.png'),
              _buildBottomNavigationBarItem(
                  1, 'assets/course.png', 'assets/course_selected.png'),
              _buildBottomNavigationBarItem(
                  2, 'assets/profile.png', 'assets/profile_selected.png'),
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
                  color:
                      _selectedIndex == i ? Colors.white : Colors.transparent,
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
                          color:
                              _selectedIndex == i ? null : Colors.transparent,
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

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      int index, String defaultIcon, String selectedIcon) {
    return BottomNavigationBarItem(
      icon:
          _buildImageIcon(_selectedIndex == index ? selectedIcon : defaultIcon),
      label: '',
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
