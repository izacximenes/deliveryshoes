import 'package:deliveryshoe/app/product_details.dart';
import 'package:deliveryshoe/components/card_shoe.dart';
import 'package:deliveryshoe/components/search.dart';
import 'package:deliveryshoe/components/shopping_cart.dart';
import 'package:deliveryshoe/utils/assets.dart';
import 'package:deliveryshoe/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Color backGroundColor = Color(0xFFfafafa);

  final List<String> titles = [
    'Recommended',
    'Trending',
    'Discount',
    'Best Sellers'
  ];

  String titleSelected;

  @override
  void initState() {
    super.initState();
    titleSelected = titles.first;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 20,
          elevation: 0.5,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.iconHome),
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.iconHeart),
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.iconBell),
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Assets.iconAccount),
                ),
                title: SizedBox.shrink()),
          ]),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: ScreenUtil.pixelRatio * 2),
          child: IconButton(
            icon: ImageIcon(
              AssetImage(
                Assets.iconMenu,
              ),
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
        actions: <Widget>[
          ShoppingCartWidget(),
          SizedBox(
            width: ScreenUtil.pixelRatio * 2,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19),
              child: SearchWidget(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: titles.length,
                        itemBuilder: (context, int index) {
                          final String item = titles[index];
                          print(item);
                          return Padding(
                            padding: EdgeInsets.only(left: 19),
                            child: Text(item,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: titleSelected == item
                                      ? Color(0xFF1b1b1b)
                                      : Color(0xFFc0c0c0),
                                  fontSize: ScreenUtil.textScaleFactory * 15,
                                )),
                          );
                        }),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 205,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: titles.length,
                        itemBuilder: (context, int index) {
                          final String heroTag = "product$index";
                          return Padding(
                            padding: EdgeInsets.only(left: 19),
                            child: CardShoeWidget(
                              heroTag: heroTag,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => ProductDetails(
                                              heroTag: heroTag,
                                            )));
                              },
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil.pixelRatio * 10,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Best Selling",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil.textScaleFactory * 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                        itemCount: titles.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, int index) {
                          final String heroTag = "productlist$index";
                          return Padding(
                            padding: EdgeInsets.only(bottom: 24),
                            child: CardShoeWidget(
                              heroTag: heroTag,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => ProductDetails(
                                              heroTag: heroTag,
                                            )));
                              },
                              rowCard: true,
                            ),
                          );
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
