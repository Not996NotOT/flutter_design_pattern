import 'package:flutter_design_pattern/views/simplefactory/class/OperationAdd.dart';
import 'package:flutter_design_pattern/views/simplefactory/class/OperationDiv.dart';
import 'package:flutter_design_pattern/views/simplefactory/class/OperationMul.dart';
import 'package:flutter_design_pattern/views/simplefactory/class/OperationSub.dart';
import 'package:flutter_design_pattern/views/simplefactory/enum/OperationEnum.dart';

abstract class Operation {
  late double number1;
  late double number2;
  factory Operation(OperationEnum operationEnum) {
    switch (operationEnum) {
      case OperationEnum.Add:
        return OperationAdd();
      case OperationEnum.Sub:
        return OperationSub();
      case OperationEnum.Mul:
        return OperationMul();
      case OperationEnum.Div:
        return OperationDiv();
      default:
        return OperationAdd();
    }
  }
  double calc();
}
