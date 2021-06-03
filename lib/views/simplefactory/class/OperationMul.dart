import 'package:flutter_design_pattern/views/simplefactory/factory/Operation.dart';

class OperationMul implements Operation {
  @override
  late double number1;

  @override
  late double number2;

  @override
  double calc() => number1 * number2;
}
