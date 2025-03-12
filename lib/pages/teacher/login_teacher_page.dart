import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qt/models/db_helper.dart';
import 'package:qt/pages/teacher/description_teacher_page.dart';
import 'package:qt/pages/teacher/registration_teacher_page.dart';
import 'package:qt/widgets/main_button.dart';
import 'package:qt/widgets/small_button.dart';
import 'package:qt/widgets/text_field.dart';

class LoginTeacherPage extends StatefulWidget {
  static const routeName = '/loginteacher-page';
  const LoginTeacherPage({super.key});

  @override
  State<LoginTeacherPage> createState() => _LoginTeacherPageState();
}

class _LoginTeacherPageState extends State<LoginTeacherPage> {
  final _formKey = GlobalKey<FormState>(); // Добавлен ключ формы
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _userLogin() async {
    if (!_formKey.currentState!.validate()) return; // Проверка валидации

    String password = _passwordController.text;
    String email = _emailController.text;

    bool isAuthenticated = await _dbHelper.isUserAuthenticated(email, password);
    if (isAuthenticated) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(DescriptionTeacherPage.routeName);
    } else {
      if (kDebugMode) print('Login failed');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неверный телефон или пароль')),
      );
      _formKey.currentState!.validate(); // Показываем ошибки
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                const Center(
                  child: Text(
                    'Вход',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 34,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Телефон',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFieldWidget(
                  inputType: TextInputType.number,
                  controller: _emailController,
                  hintText: '+7(___)___-__-__',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите телефон';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Пароль',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFieldWidget(
                  isObsText: true,
                  inputType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  hintText: 'Пароль',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите пароль';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: MainButtonWidget(
                    buttonName: 'Войти',
                    onTap: _userLogin,
                  ),
                ),
                const Center(
                  child: Text(
                    'Ещё нет аккаунта?',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 15,
                    ),
                  ),
                ),
                SmallButtonWidget(
                  buttonName: 'Зарегистрироваться',
                  buttonColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pushNamed(RegistrationTeacherPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}