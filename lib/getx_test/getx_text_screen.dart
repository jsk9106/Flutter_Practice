import 'package:flutter/material.dart';
import 'package:flutter_practice/getx_test/controller/getx_test_controller.dart';
import 'package:get/get.dart';

class GetXTestScreen extends StatelessWidget {
  final controller = Get.put(GetXTestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Test'),
      ),
      body: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => controller.setState(0),
                  child: Text(
                    'State 1',
                    style: TextStyle(
                      color: controller.state.value == 0
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => controller.setState(1),
                  child: Text(
                    'State 2',
                    style: TextStyle(
                      color: controller.state.value == 1
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => Text(
                        controller.state.value == 0 ? 'State 1' : 'State 2',
                        style: TextStyle(fontSize: 30),
                      )),
                  Text(
                    'nothing',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
