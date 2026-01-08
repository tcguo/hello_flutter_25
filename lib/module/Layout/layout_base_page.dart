
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutBasePage extends StatefulWidget {
  LayoutBasePage({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutBasePageState();
}

class _LayoutBasePageState extends State<LayoutBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("基础布局"),),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
                Container(
                width: 200,
                height: 100,
                color: Colors.red[200],
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double width = constraints.maxWidth;
                    double height = constraints.maxHeight;
                    double marginLeft = width/2.0 - 50;
                    return Container(
                      margin: EdgeInsets.only(left: marginLeft),
                      width: 50,
                      height: double.infinity,
                      color: Colors.yellow[300],
                    );
                  },

                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.black12,
                width: 250,
                height: 100,
              )
           ]
          ),
        ),
      ),


    );
  }

}