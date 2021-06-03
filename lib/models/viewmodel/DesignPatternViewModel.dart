import 'package:flutter_design_pattern/base/BaseViewModel.dart';
import 'package:flutter_design_pattern/router/RouterEnum.dart';

class DesignPatternViewModel extends BaseViewModel {
  int id;
  String name;
  RouterEnum routerEnum;
  DesignPatternViewModel(
      {required this.id, required this.name, required this.routerEnum});
}
