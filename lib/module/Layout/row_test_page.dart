import 'package:flutter/material.dart';

class RowTestPage extends StatelessWidget {
  const RowTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RowTestPage2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            color: Colors.black26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Icon(Icons.star, size: 50),
                // Icon(Icons.star, size: 200),
                // Icon(Icons.star, size: 50),
                Container(
                  color: Colors.red,
                  child: const SizedBox(width: 200, height: 50)
                ),
                Container(
                  color: Colors.blue,
                  child: const SizedBox(width: 200, height: 200)
                ),

              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            color: Colors.black26,
            /*Column: 你想所有的按钮的宽度都跟最宽的按钮那么宽，那就使用 IntrinsicWidth 和CrossAxisAlignment.stretch*/
            /*Row:如果你想所有的部件的高度跟最高的部件一样高，你需要结合 IntrinsicHeight 和 .CrossAxisAlignment.stretch 来实现。*/
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      color: Colors.red,
                      child: const SizedBox(width: 200, height: 50)
                  ),
                  Container(
                      color: Colors.blue,
                      child: const SizedBox(width: 200, height: 200)
                  ),
              
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 40,
                  color: Colors.red[200],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 1,
                child: Container(
                  height: 40,
                  color: Colors.blue[200],
                ),
              )
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 80, maxWidth: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("test"),
                SizedBox(width: 10),
                Expanded(child: Text("data is good data is gooddata is gooddata is gooddata is gooddata is gooddata is gooddata is good"))
              ],
            ),
          ),

          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  color: Colors.blue,
                  child: Text("这是一段\n很长很长\n的文字内容"),
                ),
                // 分割线现在会自动和左侧 Text 一样高
                VerticalDivider(
                  thickness: 2,
                  width: 3,
                  color: Colors.red,
                ),

                Container(
                  width: 100,
                  color: Colors.green,
                  child: Text("短文字\n短文字\n短文字\n短文字\n短文字\n短文字"),
                ),
              ],
            ),
          )


      ]),
    );
  }
}
