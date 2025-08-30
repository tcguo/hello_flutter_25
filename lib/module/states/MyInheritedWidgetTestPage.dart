
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/states/MyInheritedWidget.dart';
import 'package:hello_flutter_25/module/states/MyInheritedWidgetChildPage.dart';

class MyInheritedWidgetTestPage extends StatefulWidget {
  final String title;
  /*构造方法*/
  const MyInheritedWidgetTestPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyInheritedWidgetTestState();
}

class _MyInheritedWidgetTestState extends State<MyInheritedWidgetTestPage>{
  int _counter = 12;
  var _testColor = Colors.blue;

  _changeColor() {
    _testColor = Colors.cyan;
  }
  _changeCounter() {
    setState(() {
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: MyInheritedWidget(counter: _counter, color: _testColor, child:
        const MyInheritedWidgetChildPage(name: "GUO")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeCounter,
          tooltip: 'ChangeCounter',
          child: const Icon(Icons.add),
        )
    );
  }


}