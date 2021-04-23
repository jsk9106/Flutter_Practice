import 'package:flutter/material.dart';

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  int count = 4;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: PageView.builder(
              onPageChanged: (value) {
                print(value);
                setState(() {
                  currentPage = value;
                });
              },
              physics: BouncingScrollPhysics(),
              itemCount: count,
              itemBuilder: (context, index) => _buildPageListItem(Colors.accents[index % Colors.accents.length]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(count, (index) => _buildDot(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageListItem(Color color){
    return Container(
      color: color,
    );
  }

  Widget _buildDot(int index){
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: currentPage == index ? Colors.green : Colors.grey,
      ),
    );
  }
}
