import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/keepalive.dart';
import '../pages/addressbook/addressbook.dart';
import '../pages/mine/mine.dart';
import '../pages/employee/employlist.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;
  //为了让tabbar页面初始化一次
  List<Widget> pages = [
    KeepAliveWrapper(child: EmployeeListPage()),
    KeepAliveWrapper(child: AddressbookPage()),
    KeepAliveWrapper(child: MinePage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AutomaticKeepAliveClientMixin需要配合IndexedStack使用
      body: IndexedStack(
        children: pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded), label: '列表'.tr),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp), label: '通讯录'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'.tr),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          ;
        },
      ),
    );
  }
}
