import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({Key key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide().copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: "Search something",
          hintStyle: TextStyle(
            color: Color(0xFFcfcfcf),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFF555555),
          )),
    );
  }
}
