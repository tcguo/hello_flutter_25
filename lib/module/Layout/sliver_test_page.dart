import 'package:flutter/material.dart';

class SliverTestPage extends StatefulWidget {
  const SliverTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
   return _SliverTestPageState();
  }
}

class _SliverTestPageState extends State<SliverTestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sliver"),),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FlutterLogo(size: 48),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Text("Sliver Child List A", textAlign: TextAlign.start, style: TextStyle(fontSize: 32)),
                    Text("Sliver Child List B", textAlign: TextAlign.start, style: TextStyle(fontSize: 32)),
                    Text("Sliver Child List C", textAlign: TextAlign.start, style: TextStyle(fontSize: 32))
                  ]
              )
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                    return Text("Sliver child builder ${index+1}");
                  },
                  childCount: 10
              )
          ),

          // item固定尺寸
          SliverFixedExtentList(
            itemExtent: 45,
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  alignment: Alignment.center,
                  color: index % 2 == 0 ? Colors.black12 : Colors.black26,
                  child: Text("Sliver child builder ${index+1}"));
            },
                childCount: 20),

          ),

          // item尺寸不固定
          SliverPrototypeExtentList(
            prototypeItem: Text("test item"), // 样板不会显示在屏幕上，程序运行时行测量样板尺寸，再将列表中的每个元素固定为样板相同的尺寸。
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  alignment: Alignment.center,
                  color: index % 2 == 0 ? Colors.black12 : Colors.black26,
                  child: Text("Sliver child builder ${index+1}"));
            },
                childCount: 20),

          ),


        ],
      ),
    );
  }
}