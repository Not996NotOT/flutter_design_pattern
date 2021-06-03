import 'package:flutter/material.dart';
import 'package:flutter_design_pattern/router/Router.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner:false,
    routingCallback: routeInterceptor,
    initialRoute: initialRoute,
    getPages: routes,
  ));
}


