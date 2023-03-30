import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            snap: false,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverBar示例'.tr),
              collapseMode: CollapseMode.parallax,
              background: Image.network(
                'https://z3.ax1x.com/2021/07/12/WCvW2d.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Text('item$index')),
              itemExtent: 40)
        ],
      ),
    );
  }
}
