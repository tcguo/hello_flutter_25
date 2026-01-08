import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/Layout/layout_bet_page.dart';
import 'package:hello_flutter_25/module/Layout/list_test_page.dart';
import 'package:hello_flutter_25/module/Layout/row_test_page.dart';
import 'package:hello_flutter_25/module/Layout/sliver_test_page.dart';
import 'package:hello_flutter_25/module/Layout/layout_base_page.dart';
import 'package:hello_flutter_25/module/Layout/layout_index.dart';
import 'package:hello_flutter_25/module/Layout/layout_stack.dart';
import 'package:hello_flutter_25/pages/team/team_list_viewmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TeamListViewModel _vm = TeamListViewModel();
  // final TeamListViewModel _vm2 = TeamListViewModel();

  void loadData() {
    _vm.requestTeamList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children:  [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LayoutBasePage())
                );
              },
              child: const Text("约束、尺寸和位置", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          TextButton(
              onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute(builder: (context) => LayoutIndex())
                 );
              },
              child: const Text("弹性布局", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RowTestPage()));
              },
              child: const Text("Row布局", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LayoutStackPage()));
              },
              child: const Text("Stack", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SliverTestPage())),
              child: const Text("Sliver", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListTestPage())),
              child: const Text("List View", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LayoutBetPage())),
              child: const Text("Bet page View", style: TextStyle(color: Colors.black, fontSize: 18),)
          ),


        ]
      ),
    );
  }
}
