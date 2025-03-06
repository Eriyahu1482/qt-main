class People{
  final String peopleName;
  final String peopleFullName;
  final String peopleUrl;
  final String peopleYears;
  final String peopleEmail;
  final String peoplePhone;

People({required this.peopleName, required this.peopleUrl,  this.peopleYears = '',  this.peopleEmail = '', this.peoplePhone='', this.peopleFullName = '' });

}

final List<People> teacherMiniData =[
People(peopleName: 'Фролов Н. И.', peopleUrl: 'assets/teacher1.png', peopleYears: "Стаж работы: 12 лет", peopleEmail: 'nikolay@gmail.com', peoplePhone: '+7(941) 910 30 51', peopleFullName: 'Фролов Николай Иванович'),
People(peopleName: 'Игнатова М.А', peopleUrl: 'assets/teacher2.png',  peopleYears: "Стаж работы: 18 лет", peopleEmail: 'ingyy@gmail.com', peoplePhone: '+7(941) 910 30 51', peopleFullName: 'Игнатова Мария Алексеевна')
]; 

final List<People> pupilMiniData =[
People(peopleName: 'Пупкин Сергей', peopleUrl: 'assets/pupil1.png', peopleYears: "18 лет", peopleEmail: 'pupkipk@gmail.com', peoplePhone: '+7(941) 910 30 51'),
People(peopleName: 'Петрова Ангелина', peopleUrl: 'assets/pupil2.png', peopleYears: "18 лет", peopleEmail: 'petrooob@gmail.com', peoplePhone: '+7(980) 930 41 79')
];