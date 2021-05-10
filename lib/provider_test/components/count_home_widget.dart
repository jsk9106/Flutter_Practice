import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_test/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('asdf');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) =>  Text(
          provider.count.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
