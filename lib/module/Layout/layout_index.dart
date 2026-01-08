
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutIndex extends StatefulWidget {
  LayoutIndex({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutIndexState();
}

class _LayoutIndexState extends State<LayoutIndex> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("基础布局"),),
      body: ListView(scrollDirection: Axis.vertical,
        children: const [
          Text("row", style: TextStyle(color: Colors.black, fontSize: 20),),
          Text("column")
        ]
      ),

      
    );
  }

}