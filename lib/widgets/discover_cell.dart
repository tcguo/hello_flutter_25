import 'package:flutter/material.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final void Function(String playerId)? onLike;
  // const DiscoverCell({
  //   super.key,
  //   required this.title,
  //   required this.subTitle,
  //   this.imageName = "",
  // });

  const DiscoverCell(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.imageName = "",
      this.onLike })
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverCell> {
  bool isLike = false;
  int likeNum = 0;
  @override
  void initState() {
    super.initState();
    // 在这里请求数据
    likeNum = 12;
    isLike = true;
  }

  void testMethod() {
    List<String> names = ['12', "12", "33"];
    for (var name in names) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // width: 100,
            height: 50,
            color: Colors.yellow,
            child: Row(
              children: [
                const Image(
                    width: 20,
                    height: 20,
                    image: AssetImage("images/done.png")),
                const SizedBox(
                  width: 15,
                ),
                Text(widget.title),
                const SizedBox(width: 12, height: 12),
                Text(widget.subTitle),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 50,
            color: Colors.blue,
            child: const Row(
              children: [
                Text("data1")
              ],
            ),
          )
        ],
      ),
    );
  }
}
