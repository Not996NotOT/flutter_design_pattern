import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/base/BaseView.dart';
import 'package:flutter_design_pattern/views/index/IndexController.dart';
import 'package:get/get.dart';

class IndexView extends BaseView<IndexController> {
  @override
  Widget build(Object context) => Scaffold(
        appBar: AppBar(
          title: Text("设计模式"),
          actions: [],
        ),
        body: Container(
            child: Obx(() => ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(controller.list[index].name),
                    onTap:()=> controller.goPage(controller.list[index].routerEnum),
                  );
                }))),
      );
}
