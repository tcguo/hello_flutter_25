import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isShowLast = false;
  List<Widget> _createList() {
    List<Widget> list = [];
    Map<int, String> map = {};
    map[12] = "123";
    for (var i = 0; i < 4; i++) {
      list.add(Text("i = $i"));
      list.add(const SizedBox(width: 20));
    }
    return list;
  }

  void refreshState() {
    setState(() {
      offstage = !offstage;
    });
  }

  bool offstage = false;
  Widget _getToggleChild() {
    if (offstage) {
      return const Text("Toggle one");
    } else {
      return MaterialButton(
        onPressed: () {},
        child: const Text("Toggle two"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的页面"),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(
                child: Text('Entry B',
                    style: TextStyle(
                        color: Color.fromARGB(255, 235, 16, 38),
                        fontSize: 20,
                        fontWeight: FontWeight.normal))),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xff303339),
                  width: 1.0,
                  style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: const Color.fromARGB(255, 196, 15, 15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _createList(),
            ),
          ),
          Container(
            height: 100,
            color: Colors.amber[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                    child: Center(
                  child: Text("abc"),
                )),
                Expanded(child: Text("123")),
                Expanded(child: Text("abc")),
              ],
            ),
          ),
          Container(
            height: 100,
            color: const Color.fromARGB(255, 139, 33, 33),
            child: _getToggleChild(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refreshState();
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
