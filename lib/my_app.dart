import 'package:flutter/material.dart';
import 'package:qt/pages/progress_menu_page.dart';
import 'package:qt/pages/pupil/choose_page.dart';
import 'package:qt/pages/pupil/description_page.dart';
import 'package:qt/pages/pupil/login_page.dart';
import 'package:qt/pages/teacher/choose_teacher_page.dart';
import 'package:qt/pages/teacher/description_teacher_page.dart';
import 'package:qt/pages/teacher/login_teacher_page.dart';
import 'package:qt/pages/pupil/profile_page.dart';
import 'package:qt/pages/pupil/registration_page.dart';
import 'package:qt/pages/teacher/pupil_page.dart';
import 'package:qt/pages/teacher/registration_teacher_page.dart';
import 'package:qt/pages/pupil/teachers_page.dart';
import 'package:qt/pages/teacher/teacher_profile_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        RegistrationPage.routeName:(context) => const RegistrationPage(),
        RegistrationTeacherPage.routeName:(context) => const RegistrationTeacherPage(),
        LoginPage.routeName:(context) => const LoginPage(),
        LoginTeacherPage.routeName:(context) => const LoginTeacherPage(),
        DescriptionPage.routeName:(context) => const DescriptionPage(),
        DescriptionTeacherPage.routeName:(context) => const DescriptionTeacherPage(),
        ChoosePage.routeName:(context) => const ChoosePage(),
        ChooseTeacherPage.routeName:(context) => const ChooseTeacherPage(),
        ProfilePage.routeName:(context) => const ProfilePage(),
        ProfileTeacherPage.routeName:(context) => const ProfileTeacherPage(),
        TeacherPage.routeName:(context) => const TeacherPage(),
        PupilPage.routeName:(context) => const PupilPage(),
        ProgressMenuPage.routeName:(context) =>  const ProgressMenuPage(),
      },
    );
  }
}