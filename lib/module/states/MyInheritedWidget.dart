
import 'package:flutter/material.dart';

/*可以高效地将 共享的数据传递给子Widget树，不需要 手动将数据通过构造函数一层层往下传递*/
class MyInheritedWidget extends InheritedWidget {
 final Color color;
 final int counter;

 const MyInheritedWidget({
   super.key,
   required this.counter,
   required this.color,
   required super.child
 });

 static MyInheritedWidget? of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
 }

 @override
  bool updateShouldNotify( MyInheritedWidget oldWidget) {
    return color != oldWidget.color || counter != oldWidget.counter;
  }

}