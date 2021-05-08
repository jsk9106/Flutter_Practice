import 'package:flutter/material.dart';
import 'package:flutter_practice/drop_down/controller/drop_down_button_controller.dart';
import 'package:get/get.dart';

class MyDropdownMenu extends GetView<DropDownButtonController> {
  const MyDropdownMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => DropdownList(),
        opaque: false,
        transition: Transition.fadeIn,
      ),
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(controller.currentItem.value.name),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownList extends GetView<DropDownButtonController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Container(
                  color: Colors.white,
                  child: Container(
                    width: Get.size.width,
                    child: _dropdownList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dropdownList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: DropDownMenu.values
          .map(
            (menu) => GestureDetector(
              onTap: () {
                controller.changeDropdownMenu(menu.index);
                Get.back();
              },
              child: Container(
                color: controller.currentItem.value.index == menu.index ? Colors.blue[200] : Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(menu.name),
              ),
            ),
          )
          .toList(),
    );
  }
}
