import 'package:flutter/material.dart';
import 'package:flutter_practice/constatns.dart';
import 'package:flutter_practice/sheeps/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              _buildTitle(),
              SizedBox(height: 30),
              _buildEmailFormField(),
              SizedBox(height: 15),
              _buildPasswordFormField(),
              SizedBox(height: 30),
              errors.length != 0 ? _formErrors() : Container(),
              customButton(
                '로그인',
                () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formErrors() {
    return Column(
      children: List.generate(
          errors.length, (index) => _formErrorText(errors[index])),
    );
  }

  Row _formErrorText(String error) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 15),
        SizedBox(width: 5),
        Text(error),
      ],
    );
  }

  Text _buildTitle() {
    return Text(
      '우리가 그리워서\n돌아오셨군요!',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextFormField _buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
      },
      decoration: InputDecoration(
        hintText: '이메일 입력',
      ),
    );
  }

  TextFormField _buildPasswordFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: '비밀번호 입력',
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black54,
      ),
    );
  }
}
