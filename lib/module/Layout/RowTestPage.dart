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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 250,
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
                  color: Colors.yellow,
                  child: const SizedBox(width: 200, height: 100)
                ),
                Container(
                  color: Colors.blue,
                  child: const SizedBox(width: 200, height: 200)
                ),

              ],
            ),
        ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 250,
            color: Colors.black26,
            /*Column: 你想所有的按钮的宽度都跟最宽的按钮那么宽，那就使用 IntrinsicWidth 和CrossAxisAlignment.stretch*/
            /*Row:如果你想所有的部件的高度跟最高的部件一样高，你需要结合 IntrinsicHeight 和 .CrossAxisAlignment.stretch 来实现。*/
            child: IntrinsicHeight(
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
                      color: Colors.yellow,
                      child: const SizedBox(width: 200, height: 100)
                  ),
                  Container(
                      color: Colors.blue,
                      child: const SizedBox(width: 200, height: 200)
                  ),
              
                ],
              ),
            ),
          ),

      ]),
    );
  }
}
