import 'package:flutter_design_pattern/router/RouterEnum.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  goPage(RouterEnum routerEnum) {
    Get.toNamed(routePath[routerEnum]!);
  }
}
