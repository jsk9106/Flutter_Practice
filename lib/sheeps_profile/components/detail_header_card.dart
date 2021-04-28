import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

class DetailHeaderCard extends StatelessWidget {
  const DetailHeaderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          color: Colors.greenAccent,
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Row(
            children: [
              HexagonWidget.pointy(
                width: 50,
                color: Colors.yellow,
                elevation: 0,
                child: Icon(Icons.add_chart, color: Colors.white),
              ),
              SizedBox(width: 8),
              HexagonWidget.pointy(
                width: 50,
                color: Colors.red,
                elevation: 0,
                child: Icon(Icons.insert_chart, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}