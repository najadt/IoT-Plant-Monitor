extension ExtString on String {
  bool get isValidSocket {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPort{
    final portRegExp =  RegExp("^[0-9]+\$");
    return portRegExp.hasMatch(this);
  }

}