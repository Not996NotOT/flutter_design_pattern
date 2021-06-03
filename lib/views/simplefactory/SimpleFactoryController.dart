import 'package:flutter_design_pattern/base/BaseController.dart';
import 'package:flutter_design_pattern/views/simplefactory/enum/OperationEnum.dart';
import 'package:flutter_design_pattern/views/simplefactory/factory/Operation.dart';
import 'package:get/get.dart';
import 'model/OperationKeyModel.dart';
import 'model/OperationViewModel.dart';

class SimpleFactoryController extends BaseController {
  late List<OperationKeyModel> list;
  late Rx<OperationViewModel>? viewModel;
  late OperationEnum operationEnum;
  late bool isCleanResult;
  late String tempNumber;
  late OperationEnum tempOperationEnum;

  @override
  void onInit() {
    super.onInit();
    list = [
      new OperationKeyModel(
          id: 1, keyName: "7", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 2, keyName: "8", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 3, keyName: "9", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 4, keyName: "除", operationEnum: OperationEnum.Div),
      new OperationKeyModel(
          id: 5, keyName: "4", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 6, keyName: "5", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 7, keyName: "6", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 8, keyName: "乘", operationEnum: OperationEnum.Mul),
      new OperationKeyModel(
          id: 9, keyName: "1", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 10, keyName: "2", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 11, keyName: "3", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 12, keyName: "加", operationEnum: OperationEnum.Add),
      new OperationKeyModel(
          id: 13, keyName: "0", operationEnum: OperationEnum.Math),
      new OperationKeyModel(
          id: 14, keyName: ".", operationEnum: OperationEnum.Dot),
      new OperationKeyModel(
          id: 15, keyName: "=", operationEnum: OperationEnum.Equal),
      new OperationKeyModel(
          id: 16, keyName: "减", operationEnum: OperationEnum.Sub),
      new OperationKeyModel(
          id: 17, keyName: "清除", operationEnum: OperationEnum.Clean)
    ];
    viewModel = new Rx<OperationViewModel>(new OperationViewModel());
    _viewInit();
  }

  void _viewInit() {
    viewModel?.update((model) {
      model?.number1 = "";
      model?.number2 = "";
      model?.result = "";
    });
    this.isCleanResult = true;
    this.operationEnum = OperationEnum.Unset;
    this.tempNumber = "";
  }

  onTapFactory(OperationKeyModel operationKeyModel) {
    switch (operationKeyModel.operationEnum) {
      case OperationEnum.Math:
        _onTabNumber(operationKeyModel);
        break;
      case OperationEnum.Dot:
        _onTapDot(operationKeyModel);
        break;
      case OperationEnum.Add:
      case OperationEnum.Sub:
      case OperationEnum.Mul:
      case OperationEnum.Div:
        _onTabOperation(operationKeyModel.operationEnum);
        break;
      case OperationEnum.Equal:
        _onTapEqual();
        break;
      case OperationEnum.Clean:
        _onTabClean();
        break;
      default:
    }
  }

  _onTabNumber(OperationKeyModel operationKeyModel) {
    if (operationEnum != OperationEnum.Unset && isCleanResult) {
      viewModel?.update((model) {
        model?.result = "";
      });
      isCleanResult = false;
    }
    viewModel?.update((model) {
      model?.result += operationKeyModel.keyName;
    });
  }

  _onTapDot(OperationKeyModel operationKeyModel) {
    if (this.viewModel?.value.result.indexOf(".") == -1) {
      _onTabNumber(operationKeyModel);
    }
  }

  _onTabOperation(OperationEnum operationEnum) {
    if (this.operationEnum != OperationEnum.Unset) {
      _onTapEqual();
    } else {
      this.operationEnum = operationEnum;
      this.viewModel?.value.number1 = this.viewModel!.value.result;
      this.tempNumber = "";
    }
    this.isCleanResult = true;
  }

  _onTapEqual() {
    if (viewModel!.value.number2 == "" && tempNumber == "") {
      viewModel!.value.number2 = viewModel!.value.result;
      tempNumber = viewModel!.value.number2;
    } else {
      viewModel!.value.number2 = tempNumber;
    }
    var operation = Operation(operationEnum == OperationEnum.Unset
        ? tempOperationEnum
        : operationEnum);
    operation.number1 = double.parse(viewModel!.value.number1);
    operation.number2 = double.parse(viewModel!.value.number2);
    this.viewModel?.update((model) {
      model?.result = operation.calc().toString();
      model?.number1 = model.result;
      model?.number2 = "";
    });
    if (operationEnum != OperationEnum.Unset) {
      this.tempOperationEnum = operationEnum;
    }
    this.operationEnum = OperationEnum.Unset;
  }

  _onTabClean() {
    _viewInit();
  }
}
