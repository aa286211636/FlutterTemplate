import 'package:flutter/material.dart';
import 'nine_girdview_model.dart';

class NineGirdviewUtil {
  static String getImgPath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static Widget getWidget(String url) {
    if (url.startsWith('http')) {
      return Image.network(url);
    } else if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    } else {
      return Image.asset(
        getImgPath(url),
        fit: BoxFit.cover,
      );
    }
  }

  static Image? getBigImage(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) {
      return Image.network(url, fit: BoxFit.cover);
    }
    if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    }
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static List<ImageBean> getTestData() {
    List<String> urlList = [
      'ali_connors',
      'people/square/ali.png',
      'people/ali_landscape.png',
      'people/square/peter.png',
      'people/square/sandra.png',
      'people/square/trevor.png',
      'places/india_tanjore_bronze_works.png',
      'places/india_tanjore_market_merchant.png',
      'places/india_tanjore_thanjavur_temple_carvings.png',
    ];
    List<ImageBean> tempList = [];
    for (int i = 0; i < urlList.length; i++) {
      tempList.add(ImageBean(
        originPath: urlList[i],
        middlePath: urlList[i],
        thumbPath: urlList[i],
        originalWidth: i == 0 ? 264 : null,
        originalHeight: i == 0 ? 258 : null,
      ));
    }
    return tempList;
  }
}
