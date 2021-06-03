import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/base/BaseView.dart';
import 'package:flutter_design_pattern/views/simplefactory/SimpleFactoryController.dart';
import 'package:flutter_design_pattern/views/simplefactory/enum/OperationEnum.dart';
import 'package:get/get.dart';

class SimpleFactoryView extends BaseView<SimpleFactoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("简单工厂之计算器")),
      body: Container(
        child: Column(
          children: [
            Obx(() => Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  height: 100,
                  child: Text(
                    controller.viewModel!.value.result.toString(),
                    style: TextStyle(color: Colors.black54, fontSize: 24),
                  ),
                )),
            Expanded(
                child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              color: Colors.black12,
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: controller.list
                    .where((item) => item.operationEnum != OperationEnum.Clean)
                    .map((item) => Container(
                        color: Colors.white,
                        height: Get.width * 0.11,
                        width: Get.width * 0.22,
                        child: TextButton(
                            child: Text(item.keyName),
                            onPressed: () => controller.onTapFactory(item))))
                    .toList(),
              ),
            )),
            Container(
                color: Colors.white,
                height: Get.width * 0.11,
                width: Get.width,
                child: TextButton(
                    child: Text("清除"),
                    onPressed: () => controller.onTapFactory(controller.list
                        .singleWhere((item) =>
                            item.operationEnum == OperationEnum.Clean))))
          ],
        ),
      ),
    );
  }
}
