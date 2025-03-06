validateEmail(String email){
final emailReg = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?_`{|}~-]+@[a-z]"
);
return emailReg.hasMatch(email);
}