import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_app/model/sales_box_model.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/widget/local_nav.dart';
import 'package:flutter_app/widget/sales_box.dart';
import 'package:flutter_app/widget/search_bar.dart';
import 'package:flutter_app/widget/sub_nav.dart';
import 'package:flutter_app/widget/web_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/widget/grid_nav.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/widget/loading_container.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  String resultString = "";
  List<CommonModel> bannerList = [];
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  bool _loading = true;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        resultString = json.encode(model);
        bannerList = model.bannerList;
        localNavList = model.localNavList;
        subNavList = model.subNavList;
        gridNavModel = model.gridNav;
        salesBoxModel = model.salesBox;
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return null;
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(
                          itemCount: bannerList.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    CommonModel model = bannerList[index];
                                    return WebView(
                                      url: model.url,
                                      title: model.title,
                                      hideAppBar: model.hideAppBar,
                                    );
                                  }),
                                );
                              },
                              child: Image.network(
                                bannerList[index].icon,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          pagination: SwiperPagination(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                        child: LocalNav(localNavList: localNavList),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                        child: GridNav(gridNavModel: gridNavModel),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                        child: SubNav(subNavList: subNavList),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                        child: SalesBox(
                          salesBox: salesBoxModel,
                        ),
                      ),
                      Container(
                        height: 800,
                        child: ListTile(
                          title: Text('resultString'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _appBar,
          ],
        ),
      ),
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        ),
      ],
    );
  }

  _jumpToSearch() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage(
        hint: SEARCH_BAR_DEFAULT_TEXT,
      );
    }));
  }

  _jumpToSpeak() {}
}
