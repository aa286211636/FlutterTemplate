import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
  List pages = [FormPage(), AddressbookPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
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
