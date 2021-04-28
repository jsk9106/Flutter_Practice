import 'package:flutter/material.dart';

Container buildInfoCard(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey[300],
    ),
    alignment: Alignment.center,
    child: Text(text, style: TextStyle(fontSize: 11)),
  );
}