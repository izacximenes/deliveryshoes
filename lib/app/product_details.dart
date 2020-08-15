import 'package:deliveryshoe/components/shopping_cart.dart';
import 'package:deliveryshoe/utils/assets.dart';
import 'package:deliveryshoe/utils/size_config.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class ProductDetails extends StatefulWidget {
  final String heroTag;
  ProductDetails({Key key, @required this.heroTag}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final Color backGroundColor = Color(0xFFfafafa);

  final List<String> sizes = ["08", "09", "10", "11", "12"];

  Widget sizeWidget({
    @required String size,
    bool selected = false,
  }) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Color(0xFFfafafa),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Center(
          child: Text(
        size,
        style: TextStyle(
          color: selected ? Colors.white : Color(0xFF898989),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? Padding(
                padding: EdgeInsets.only(left: ScreenUtil.pixelRatio * 2),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              )
            : null,
        actions: <Widget>[
          ShoppingCartWidget(),
          SizedBox(
            width: ScreenUtil.pixelRatio * 2,
          )
        ],
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color(0xFFfafafa),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                  child: Center(
                    child: Text(
                      "Order Now",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                )),
              ],
            ),
          )),
      body: Container(
        height: ScreenUtil.screenHeightDp,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Brand",
                  style: TextStyle(
                      color: Color(0xFF656565),
                      fontSize: ScreenUtil.textScaleFactory * 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Your Shoes \nBrand Name",
                  style: TextStyle(
                      color: Color(0xFF2a2a2a),
                      fontSize: ScreenUtil.textScaleFactory * 22,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Hero(
                      tag: widget.heroTag,
                      child: ExtendedImage.network(
                          "https://www.stadiumgoods.com/cdn-cgi/image/fit%3Dcontain%2Cformat%3Dauto%2Cwidth%3D720/media/catalog/product/c/q/cq5486_200.png"),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenUtil.screenHeightDp * 0.45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Reviews",
                            style: TextStyle(
                                color: Color(0xFFa9a9a9),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "There are amny variantions are of the passages of lorem available, but there majoritys have are suffered is alteration in some forms, by the injected of humour, ors randomised words which.",
                            style: TextStyle(
                                color: Color(0xFF969696),
                                fontSize: 14.2,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(children: <Widget>[
                        Text(
                          "Size",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: List.generate(sizes.length, (index) {
                          final String item = sizes[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child:
                                sizeWidget(size: item, selected: item == "10"),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
