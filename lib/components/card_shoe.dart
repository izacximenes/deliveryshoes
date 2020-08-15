import 'package:deliveryshoe/utils/size_config.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class CardShoeWidget extends StatefulWidget {
  final bool rowCard;
  final VoidCallback onTap;
  final String heroTag;
  CardShoeWidget(
      {Key key, this.rowCard = false, this.onTap, @required this.heroTag})
      : super(key: key);

  @override
  _CardShoeWidgetState createState() => _CardShoeWidgetState();
}

class _CardShoeWidgetState extends State<CardShoeWidget> {
  int amount = 1;
  Widget buttonIcon({IconData icon, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          child: Icon(icon, size: 18, color: Color(0xFF181818)),
        ),
      ),
    );
  }

  final String url =
      "https://www.stadiumgoods.com/cdn-cgi/image/fit%3Dcontain%2Cformat%3Dauto%2Cwidth%3D720/media/catalog/product/c/q/cq5486_200.png";
  void addAmount() {
    setState(() {
      amount++;
    });
  }

  void removeAmount() {
    if (amount > 1) {
      setState(() {
        amount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);

    return widget.rowCard
        ? InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 90,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 95,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: widget.heroTag,
                        child: ExtendedImage.network(
                          url,
                          width: 75,
                          height: 75,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Moderm Bes Shoe",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4b4b4b).withOpacity(.8),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: ScreenUtil.pixelRatio,
                      ),
                      Text(
                        "Sports Shoe",
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFd4d2d2),
                            fontWeight: FontWeight.w400),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              buttonIcon(icon: Mdi.minus, onTap: removeAmount),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                amount.toString(),
                                style: TextStyle(
                                    color: Color(0xFF181818),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              buttonIcon(icon: Mdi.plus, onTap: addAmount),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "R\$ 120,00",
                        style: TextStyle(
                            fontSize: ScreenUtil.textScaleFactory * 14,
                            color: Color(0xFF585858),
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        : InkWell(
            onTap: widget.onTap,
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: widget.heroTag,
                            child: ExtendedImage.network(
                              url,
                              constraints: BoxConstraints(maxWidth: 120),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Moderm Bes Shoe",
                                  style: TextStyle(
                                      fontSize:
                                          ScreenUtil.textScaleFactory * 13,
                                      color: Color(0xFF585858),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: ScreenUtil.pixelRatio,
                                ),
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: Color(0xFFe48a00),
                                            size: 10,
                                          )).toList(),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                "R\$ 120,00",
                                style: TextStyle(
                                    fontSize: ScreenUtil.textScaleFactory * 14,
                                    color: Color(0xFF585858),
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(7),
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                    bottomRight: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(
                                Mdi.plus,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
