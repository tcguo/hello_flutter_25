import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/states/MyInheritedWidget.dart';

class MyInheritedWidgetChildPage extends StatefulWidget {
  final String name;
  const MyInheritedWidgetChildPage({super.key, required this.name});

  @override
  State<MyInheritedWidgetChildPage> createState() {
    return MyInheritedWidgetChildState();
  }
}

class MyInheritedWidgetChildState extends State<MyInheritedWidgetChildPage> {
  @override
  Widget build(BuildContext context) {
    final color = MyInheritedWidget.of(context)?.color ?? Colors.black;
    final counter = MyInheritedWidget.of(context)?.counter ?? 100;
    return Column(
      mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Container(
              padding: const EdgeInsets.only(left: 14, right: 14),
              alignment: Alignment.center,
              child: Text('$counter', style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.yellow),),
            ),
          const SizedBox(width: double.infinity, height: 5),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 14, right: 14),
            alignment: Alignment.center,
            color: color,
            child: Text(widget.name),
          ),

      ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ChildState:didChangeDependencies");
  }
}