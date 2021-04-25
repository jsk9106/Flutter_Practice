import 'package:flutter/material.dart';
import 'package:flutter_practice/sheeps/slide_model.dart';

import 'custom_button.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

int currentIndex = 0;

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildPageContainer(),
            Spacer(),
            Spacer(),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  Expanded _buildBottom() {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(slideList.length, (index) => _buildDot(index)),
          ),
          SizedBox(height: 20),
          customButton('시작하기', (){}),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('이미 계정을 보유하고 있다면 '),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/loginPage'),
                child: Text(
                  '로그인',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      width: currentIndex == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: currentIndex == index ? Colors.green : Colors.grey,
      ),
    );
  }

  Expanded _buildPageContainer() {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: slideList.length,
          itemBuilder: (context, index) => _buildPageItem(slideList[index]),
        ),
      ),
    );
  }

  Widget _buildPageItem(Map<String, String> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Icon(Icons.store_mall_directory, size: 40),
        SizedBox(height: 20),
        Text(
          item['title']!,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          item['description']!,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
