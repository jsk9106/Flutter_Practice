import 'package:flutter/material.dart';

GestureDetector customButton(String text, GestureTapCallback press) {
  return GestureDetector(
    onTap: press,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
  );
}
