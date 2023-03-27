import 'package:flutter/material.dart';
import '../common/keepalive.dart';
import '../pages/form.dart';
import '../pages/mine.dart';
import '../pages/addressbook.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;
  //为了让tabbar页面初始化一次
  List<Widget> pages = [
    KeepAliveWrapper(child: FormPage()),
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
              icon: Icon(Icons.list_alt_rounded), label: '列表'),
          BottomNavigationBarItem(icon: Icon(Icons.book_sharp), label: '通讯录'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
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
