import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Center(
        child: Container(
      width: Get.width * 0.8,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            box.erase();
            Get.offAllNamed('/login');
          },
          child: Text('退出登录')),
    ));
  }
}
