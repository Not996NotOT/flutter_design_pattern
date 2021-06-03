import 'package:flutter_design_pattern/views/simplefactory/enum/OperationEnum.dart';

class OperationKeyModel {
  late int id;
  late String keyName;
  late OperationEnum operationEnum;
  OperationKeyModel({required this.id,required this.keyName,required this.operationEnum});
}