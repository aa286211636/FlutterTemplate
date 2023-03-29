import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:get/get.dart';
import '../example/citymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<CityModel> cityList = [];
  List<CityModel> _hotCityList = [];
  double susHeight = 40;
  @override
  void initState() {
    super.initState();
    _hotCityList.add(CityModel(name: '北京市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '广州市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '成都市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '深圳市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '杭州市', tagIndex: '★'));
    _hotCityList.add(CityModel(name: '武汉市', tagIndex: '★'));
    cityList.addAll(_hotCityList);
    SuspensionUtil.setShowSuspensionStatus(cityList);

    Future.delayed(Duration(milliseconds: 500), () {
      loadData();
    });
  }

  void loadData() async {
    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      cityList.clear();
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((v) {
        cityList.add(CityModel.fromJson(v));
      });
      _handleList(cityList);
    });
  }

  void _handleList(List<CityModel> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(list);

    // add hotCityList.
    cityList.insertAll(0, _hotCityList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(cityList);

    setState(() {});
  }

  Widget getSusItem(String tag) {
    if (tag == '★') {
      tag = '★ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  Widget getListItem(CityModel model) {
    return ListTile(
      title: Text(model.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('城市列表示例'.tr),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: AzListView(
              data: cityList,
              itemCount: cityList.length,
              itemBuilder: (BuildContext context, int index) {
                CityModel model = cityList[index];
                return getListItem(model);
              },
              padding: EdgeInsets.zero,
              susItemBuilder: (BuildContext context, int index) {
                CityModel model = cityList[index];
                String tag = model.getSuspensionTag();
                return getSusItem(tag);
              },
              indexBarData: ['★', ...kIndexBarData],
            ),
          )
        ],
      ),
    );
  }
}
