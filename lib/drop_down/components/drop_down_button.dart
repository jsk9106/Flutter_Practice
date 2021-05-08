import 'package:flutter/material.dart';
import 'package:flutter_practice/drop_down/controller/drop_down_button_controller.dart';
import 'package:get/get.dart';

class CustomDropdownButton extends GetView<DropDownButtonController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton(
        value: controller.currentItem.value.index,
        onChanged: (int? value) {
          controller.changeDropdownMenu(value!);
        },
        items: DropDownMenu.values
            .map(
              (menu) => DropdownMenuItem(
                value: menu.index,
                child: Text(menu.name),
              ),
            ).toList(),

        // items: [
        //   DropdownMenuItem(
        //     value: 0,
        //     child: Text('메뉴1'),
        //   ),
        //   DropdownMenuItem(
        //     value: 1,
        //     child: Text('메뉴2'),
        //   ),
        // ],
      ),
    );
  }
}
