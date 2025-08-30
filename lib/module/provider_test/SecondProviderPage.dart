import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/provider_test/CounterModel.dart';
import 'package:hello_flutter_25/module/provider_test/TestView.dart';
import 'package:provider/provider.dart';


class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("12"));
  }
}

class SecondProviderPage extends StatefulWidget {
  const SecondProviderPage({super.key});
  @override
  State<SecondProviderPage> createState() => SecondProviderPageState();
}

class SecondProviderPageState extends State<SecondProviderPage> {
  var _localName = "local name";
  CounterModel? counter;

  void changeProviderVal(CounterModel _counter) {
    _counter.increment();
    _counter.updateUserName("guojing-${counter?.counter}");
    setState(() {
      _localName = "local name-changed-${counter?.counter}";
    });
  }

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('SecondProviderPage')),
      // 展示资源中的数据
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('Counter: ${counter?.counter}'),
          Text('Counter: ${counter?.userName}'),
          Text('LocalName: $_localName'),
          // 用资源更新方法来设置按钮点击回调
          // ElevatedButton(
          //     onPressed: changeProviderVal ,
          //     child: const Icon(Icons.add)),
          Container(color: Colors.blue,
            height: 200,
            alignment: Alignment.center,
            child: Selector<CounterModel, int>(builder: (context, cm, child) {
              final counter2 = Provider.of<CounterModel>(context);
                  return Column(children: [
                    Text("selector counter: $cm"),
                    ElevatedButton(
                        onPressed: ()=> {
                          changeProviderVal(counter2)
                        },
                        child: const Icon(Icons.add)),
                    child!  // 这里插入不会重建的部分
                  ],);
                },
                selector: (context, cm) {
                  return cm.counter;
                },
                shouldRebuild: (pre, next) {
                  return pre != next;
                },
                child: const TestView(), // 这部分不会随 model变化而重 ,不依赖状态变化的组件
            )
          )
        ],
      ),
    );
  }
}