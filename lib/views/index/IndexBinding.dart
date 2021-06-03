import 'package:flutter_design_pattern/views/index/IndexController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
class IndexBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<IndexController>(() => IndexController());
  }
}