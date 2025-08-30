import 'package:flutter/material.dart';

class NBATeamListPage extends StatefulWidget {
  static const routePath = "/teamList";
  const NBATeamListPage({super.key});

  @override
  State<StatefulWidget> createState() => _NBATeamListPageState();
}

class _NBATeamListPageState extends State<NBATeamListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("球队列表"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
            child: GridView.builder(
          padding: const EdgeInsets.only(top: 20),
          itemCount: 100,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          "https://img1.baidu.com/it/u=1135518964,3685111695&fm=253&fmt=auto&app=120&f=PNG?w=190&h=190")),
                  const Text(
                    "篮网",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 4),
        )),
      ),
    );
  }
}
