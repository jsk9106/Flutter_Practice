import 'package:get/get.dart';

class GetXTestController extends GetxController{
  RxInt state = 0.obs;

  void setState(int value){
    state(value);
  }
}