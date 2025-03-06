import 'package:flutter/material.dart';
import 'package:qt/models/db_helper.dart';
import 'package:qt/models/user_model.dart';
import 'package:qt/pages/pupil/login_page.dart';
import 'package:qt/pages/teacher/registration_teacher_page.dart';
import 'package:qt/widgets/main_button.dart';
import 'package:qt/widgets/registration_button_widget.dart';
import 'package:qt/widgets/small_button.dart';
import 'package:qt/widgets/text_field.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/registration-page';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _singUp() async {
    String nick = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String phone = _phoneController.text;
    String age = _ageController.text;

    if (nick.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty || age.isEmpty) {
print('registrarion failed');
} else {
UserModel user = UserModel(email: email, password: password);
await _dbHelper.insertUser(user);
Navigator.of(context).pushNamedAndRemoveUntil(
LoginPage.routeName,
(Route<dynamic> route) => false,
);
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 241, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ),
              const SizedBox(height: 5),
               const Center(
                child: Text(
                  'Кем вы являетесь?',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                const SizedBox(width: 20,),
                RegistrationButtonWidget(buttonName: 'Ученик', onTap: (){}, buttonRadiusRight: 0, buttonRadiusLeft: 12, buttonColor1: 69, buttonColor2: 86, buttonColor3: 186, buttonColor4: 1, buttonTextColor1: 255, buttonTextColor2: 255, buttonTextColor3: 255, buttonTextColor4: 1,),
                RegistrationButtonWidget(buttonName: 'Учитель', onTap: (){
                  Navigator.of(context).pushNamed(RegistrationTeacherPage.routeName);
                }, buttonRadiusRight: 12, buttonRadiusLeft: 0, buttonColor1: 255, buttonColor2: 255, buttonColor3: 255, buttonColor4: 1, buttonTextColor1: 69, buttonTextColor2: 86, buttonTextColor3: 186, buttonTextColor4: 1,),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(right: 190),
                    child: Text(
                    'Имя, Фамилия',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                   ),
                  ),
                  TextFieldWidget(
                    controller: _nicknameController,
                    hintText: 'Имя, фамилия',),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 250),
                    child: Text(
                    'Телефон',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                   ),
                  ),
                  TextFieldWidget(
                    controller: _phoneController, 
                    hintText: '+7(___)___-__-__'
                    ),
                    const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 270),
                    child: Text(
                    'E-mail',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                   ),
                  ),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: 'vanovivan@gmail.com',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 250),
                    child: Text(
                    'Возраст',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                   ),
                  ),
                  TextFieldWidget(
                    controller: _ageController,
                    hintText: 'Полных лет',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 250),
                    child: Text(
                    'Пароль',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 86, 186, 1),
                      fontSize: 20,
                    ),
                   ),
                  ),
                  TextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Пароль',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButtonWidget(
                    buttonName: 'ЗАРЕГЕСТРИРОВАТЬСЯ',
                    onTap: _singUp,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                child: Text(
                  'Вы уже зарегистрированы?',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 86, 186, 1),
                    fontSize: 16,
                  ),
                ),
              ),
                  Center(
                    child: SmallButtonWidget(
                      buttonName: 'Войти',
                      buttonColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}