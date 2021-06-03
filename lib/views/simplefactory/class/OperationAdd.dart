import 'package:flutter_design_pattern/views/simplefactory/factory/Operation.dart';

class OperationAdd implements Operation {
  @override
  double calc() {
    return this.number1 + this.number2;
  }
  @override
  late double number1;

  @override
  late double number2;
}
