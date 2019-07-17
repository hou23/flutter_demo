import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/service_method.dart';

class StorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StorePageState();
  }
}

// 首页布局
class _StorePageState extends State<StorePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            TextField(
              controller: null,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: storeHomepage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map> bannerList = (snapshot.data['Banner'] as List).cast();
            return Column(
              children: <Widget>[
                Banner(bannerList: bannerList),
              ],
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }
}

class Banner extends StatelessWidget {
  final List bannerList;

  const Banner({Key key, this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "${bannerList[index]['photo']}",
            fit: BoxFit.fill,
          );
        },
        onTap: (int index) {
          print('跳转活动页: ${bannerList[index]['url']}');
        },
        itemCount: bannerList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
