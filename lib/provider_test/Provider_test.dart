import 'package:flutter/material.dart';
import 'package:flutter_practice/provider_test/components/count_home_widget.dart';
import 'package:flutter_practice/provider_test/provider/count_provider.dart';
import 'package:provider/provider.dart';

class ProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountProvider _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider test'),
      ),
      body: CountHomeWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _countProvider.add();
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              _countProvider.remove();
            },
          ),
        ],
      ),
    );
  }
}
