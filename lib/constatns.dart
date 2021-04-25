import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.black26,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    )
);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "이메일을 입력해주세요";
const String kInvalidEmailError = "정확한 이메일을 입력해주세요";
const String kPassNullError = "비밀번호를 입력해주세요";
const String kShortPassError = "비밀번호가 너무 짧습니다";
const String kMatchPassError = "비밀번호가 맞지 않습니다";