import 'package:flutter/material.dart';

class FirendCell extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FirendState();
}

class _FirendState extends State<FirendCell> {
  var name = "guo";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(left: 14, top: 12, right: 14, bottom: 12),
      child: Row(
        children: [
          Text(name),
          Text(name),
          Text(name)
        ],
      ),
    );
  }
}