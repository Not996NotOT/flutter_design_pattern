import 'package:flutter_design_pattern/views/simplefactory/factory/Operation.dart';

class OperationSub implements Operation {
  @override
  late double number1;

  @override
  late double number2;

  @override
  double calc() {
    return number1 - number2;
  }
}
