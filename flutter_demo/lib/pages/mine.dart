import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  late var isChinese;

  @override
  void initState() {
    isChinese = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              box.erase();
              Get.offAllNamed('/login');
            },
            child: Text('退出登录'.tr)),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: Text('夜间模式切换'.tr)),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isChinese = !isChinese;
              });
              Get.updateLocale(isChinese ? Locale('en_US'):Locale('zh_CN'));
            },
            child: Text('中英文切换'.tr)),
      ],
    ));
  }
}
