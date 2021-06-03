import 'package:flutter_design_pattern/views/index/IndexBinding.dart';
import 'package:flutter_design_pattern/views/index/IndexView.dart';
import 'package:flutter_design_pattern/views/simplefactory/SimpleFactoryBinding.dart';
import 'package:flutter_design_pattern/views/simplefactory/SimpleFactoryView.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'RouterEnum.dart';

var initialRoute = routePath[RouterEnum.Index]!;

var routes = [
  GetPage(
      name: routePath[RouterEnum.Index]!,
      page: () => IndexView(),
      binding: IndexBinding()),
  GetPage(
      name: routePath[RouterEnum.SimpleFactory]!,
      page: () => SimpleFactoryView(),
      binding: SimpleFactoryBinding())
];

var routeInterceptor =
    (Routing? routing) => print(routing?.route?.settings.name);
