import 'package:flutter_design_pattern/views/simplefactory/SimpleFactoryController.dart';
import 'package:get/get.dart';

class SimpleFactoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimpleFactoryController>(() => SimpleFactoryController());
  }
}