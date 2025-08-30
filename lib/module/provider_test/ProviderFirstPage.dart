import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/provider_test/CounterModel.dart';
import 'package:provider/provider.dart';
import 'package:hello_flutter_25/module/provider_test/SecondProviderPage.dart';
import 'package:hello_flutter_25/module/provider_test/TestView.dart';

typedef ClosePeroidWidgetCallback = void Function(BuildContext context);
class ProviderFirstPage extends StatefulWidget {
  const ProviderFirstPage({super.key});
  // ClosePeroidWidgetCallback? closeCallback;

  @override
  State<ProviderFirstPage> createState() => ProviderFirstPageState();
}

/*Provider.of() 有一个参数 listen，默认为true，即监听状态变化，调用了此方法的Widget将会被重建。
如果只是想在 Widget#build() 中访问状态，建议设置 listen: false 以减少不必要的重建。*/
/* Consumer 调优小技巧
Consumer有个可选的 Widget? child 参数，可以将 不需要在每次状态更新时重建的组件 放在这个参数中，这样可以 缩小控件的刷新范围，提高性能。*/

class ProviderFirstPageState  extends State<ProviderFirstPage> {
  CounterModel? _counter;
  @override
  Widget build(BuildContext context) {
    // _counter = Provider.of<CounterModel>(context);
     return Container(child: Column(
       children: [
         Consumer<CounterModel>(builder: (context, CounterModel counter, child) {
           return Column(children: [
             Text('Counter= ${counter.counter}'),
             child!  // 这里插入不会重建的部分
           ],);
          }, child: const Column(children: [
            // 这部分不会随 model变化而重 ,不依赖状态变化的组件
            TestView(),
            Text("不依赖状态变化的组件,我不会重建的部分")
         ],),),

         Consumer<CounterModel>(builder: (context, CounterModel counter, child) => ElevatedButton(
             child: const Text('进入二级界面'),
             onPressed: (){
               counter.increment();
             })),
         // _buildCloseButton(context),
         // Text("username: ${_counter?.userName}"),
         Text("${Provider.of<CounterModel>(context, listen: true).counter}")
       ],
     ));
  }

  // 构建子widget
  _buildCloseButton(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          // 取widget中的值
          // widget.closeCallback?.call(context);
        },
        child: Container (
          width: 200,
          height: 20,
          alignment: Alignment.center,
          child: Text('${counter.counter}', style: TextStyle(fontSize: 12, color: Colors.red)),
          color: Colors.black,
        ),
      ),
    );
  }
}


