import 'dart:convert';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';
import '../addressbook/contactmodel.dart';

class AddressbookPage extends StatefulWidget {
  const AddressbookPage({super.key});

  @override
  State<AddressbookPage> createState() => _AddressbookPageState();
}

class _AddressbookPageState extends State<AddressbookPage> {
  final List<ContactModel> _contacts = [];
  double susItemHeight = 40;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    //加载联系人列表
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      for (var V in list) {
        _contacts.add(ContactModel.fromJson(V));
      }
       _handleList(_contacts); 
    });
  }

//处理数据
  void _handleList(List<ContactModel> list) {
    if (list.isEmpty) return;
    for (var i = 0; i < list.length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    //A-Z sort
    SuspensionUtil.sortListBySuspensionTag(_contacts);
    //show sus tag
    SuspensionUtil.setShowSuspensionStatus(_contacts);
    setState(() {});
  }

  Widget _buildSusWiget(String susTag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: susItemHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            susTag,
            textScaleFactor: 1.2,
          ),
          const Expanded(
              child: Divider(
            height: 0,
            indent: 10,
          ))
        ],
      ),
    );
  }

  Widget _buildListItem(ContactModel model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: [
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWiget(susTag),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              model.name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(model.name),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'.tr),
      ),
      body: AzListView(
        data: _contacts,
        itemCount: _contacts.length,
        physics: const BouncingScrollPhysics(),
        indexBarData: SuspensionUtil.getTagIndexList(_contacts),
        indexBarMargin: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          ContactModel model = _contacts[index];
          return _buildListItem(model);
        },
        indexBarOptions: IndexBarOptions(
            needRebuild: true,
            decoration: BoxDecoration(color: Colors.grey[50]!),
            downDecoration: const BoxDecoration(color: Colors.grey)),
      ),
    );
  }
}
