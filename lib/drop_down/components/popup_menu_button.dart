import 'package:flutter/material.dart';
import 'package:flutter_practice/drop_down/controller/drop_down_button_controller.dart';
import 'package:get/get.dart';

class CustomPopupMenuButton extends GetView<DropDownButtonController> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 50),
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          0),
      elevation: 0.0,
      onSelected: (int value) => controller.changeDropdownMenu(value),
      itemBuilder: (context) {
        return DropDownMenu.values
            .map(
              (menu) => PopupMenuItem(
                value: menu.index,
                child: Text(menu.name),
              ),
            )
            .toList();
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(controller.currentItem.value.name),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }
}
