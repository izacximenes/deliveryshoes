import 'package:deliveryshoe/utils/assets.dart';
import 'package:flutter/material.dart';

class ShoppingCartWidget extends StatefulWidget {
  ShoppingCartWidget({Key key}) : super(key: key);

  @override
  _ShoppingCartWidgetState createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 14,
            left: 28,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            )),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage(
              Assets.iconShoppingCart,
            ),
            size: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
