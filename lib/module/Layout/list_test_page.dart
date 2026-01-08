
import 'package:flutter/material.dart';

class ListTestPage extends StatefulWidget {
  const ListTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListTestPageState();
  }
}

class _ListTestPageState extends State<ListTestPage> {
  List<ListRow> datas = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      datas.add(ListRow(RowType.skills));
      datas.add(ListRow(RowType.baseinfo));
      datas.add(ListRow(RowType.vip));
    });
  }
  void handleTap({required ListRow row}) {
    if (RowType.baseinfo == row.type) {
      print("handleTap is BaseInfo");
    }
    if (RowType.vip == row.type) {
      print("handleTap is vip");
    }
    if (RowType.skills == row.type) {
      print("handleTap is skills");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("list view")),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          var data = datas[index];
          return GestureDetector(
            onTap: () => handleTap(row: data),
            child: data.createRow(context, index)
          );
        },
      ),

    );
  }
}

enum RowType {
  baseinfo,
  skills,
  vip
}
class ListRow {
  late final RowType type;
  ListRow(this.type);
  Widget createRow(BuildContext context, int index) {
    if (type == RowType.baseinfo) {
      return Container(
        height: 30,
        color: Colors.red.shade100,
        child: const Text("info"),
      );
    } else if (type == RowType.skills) {
      return Container(
        height: 50,
        color: Colors.red.shade200,
        child: const Text("Skills"),
      );
    } else {
      return Container(
        height: 70,
        color: Colors.yellow.shade200,
        child: const Text("Vip"),
      );
    }
  }
}