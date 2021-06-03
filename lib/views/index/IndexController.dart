import 'package:flutter_design_pattern/base/BaseController.dart';
import 'package:flutter_design_pattern/models/viewmodel/DesignPatternViewModel.dart';
import 'package:flutter_design_pattern/router/RouterEnum.dart';
import 'package:get/get.dart';

class IndexController extends BaseController {
  late RxList<DesignPatternViewModel> list;
  @override
  void onInit() {
    super.onInit();
    list = new RxList<DesignPatternViewModel>();
    list.add(new DesignPatternViewModel(id: 1, name: "简单工厂模式",routerEnum: RouterEnum.SimpleFactory));
  }
}
