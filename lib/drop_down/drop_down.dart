import 'package:flutter/material.dart';
import 'package:flutter_practice/drop_down/components/default_page.dart';
import 'package:flutter_practice/drop_down/components/drop_down_button.dart';
import 'package:flutter_practice/drop_down/components/my_dropdown_menu.dart';
import 'package:flutter_practice/drop_down/components/page1.dart';
import 'package:flutter_practice/drop_down/components/page2.dart';
import 'package:flutter_practice/drop_down/components/popup_menu_button.dart';
import 'package:flutter_practice/drop_down/controller/drop_down_button_controller.dart';
import 'package:get/get.dart';

class DropDown extends StatelessWidget {
  static String routeName = '/dropDown';
  final DropDownButtonController controller =
      Get.put(DropDownButtonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown Sample'),
      ),
      body: Column(
        children: [
          // CustomDropdownButton(),
          // CustomPopupMenuButton(),
          MyDropdownMenu(key: controller.dropKey),
          Expanded(
            child: Obx(
              () {
                switch (controller.currentItem.value) {
                  case DropDownMenu.DEFAULT:
                    return DefaultPage();
                  case DropDownMenu.MENU1:
                    return Page1();
                  case DropDownMenu.MENU2:
                    return Page2();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
