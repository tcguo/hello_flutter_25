import 'package:flutter/material.dart';
import 'package:hello_flutter_25/extensions/safe_getter.dart';
import 'package:hello_flutter_25/pages/team/teame_list_page.dart';
import 'package:hello_flutter_25/request_api/team_list_request.dart';
import 'package:hello_flutter_25/widgets/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<DiscoverDataItem> datas = [
    DiscoverDataItem("1", "我是subtitle1", "done"),
    DiscoverDataItem("2", "我是subtitle2", "done"),
    DiscoverDataItem("3", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
    DiscoverDataItem("4", "我是subtitle3", "done"),
  ];

  TeamListRequest? _request;

  void requestTeamList() async {
    try {
      _request = TeamListRequest();
      var list = [12, 22];
      dynamic data = await _request?.request();
      var safeAbleData = SafeAbleData(data);
      var conferences =
          safeAbleData.safeData("data")?.getList("conferences") ?? [];
      print(conferences);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("发现页面"),
      ),

      // 外层最好用container包一下，方便后续扩展
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    requestTeamList();
                  },
                  child: const Text("获取天气数据")),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NBATeamListPage.routePath);
                },
                child: const Text("球队列表"),
              ),
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        DiscoverDataItem item = datas[index];
                        return DiscoverCell(
                          title: item.title,
                          subTitle: item.subTitle,
                          onLike: (String name) {

                          },
                        );
                      })),
            ],
          )),
    );
  }
}
class DiscoverDataItem {
  final String title;
  final String subTitle;
  final String imageName;

  DiscoverDataItem(this.title, this.subTitle, this.imageName);
}
