import 'package:flutter_design_pattern/base/BaseController.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
abstract class BaseView<T extends BaseController> extends GetView<T> {}