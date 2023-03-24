import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RouterTabMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouterTabMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    GetStorage box = GetStorage();
    if (box.hasData('loginInfo') == false) {
      return RouteSettings(name: '/login');
    } else if (route == '/') {
       return RouteSettings(name: '/');
    }
    return null;
  }
}
