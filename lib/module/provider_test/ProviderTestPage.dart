import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter_25/module/provider_test/CounterModel.dart';
import 'package:hello_flutter_25/module/provider_test/ProviderFirstPage.dart';
import 'package:hello_flutter_25/module/provider_test/SecondProviderPage.dart';
import 'package:provider/provider.dart';

class ProviderTestPage extends  StatefulWidget {
  const ProviderTestPage({super.key});
  @override
  State<StatefulWidget> createState() => ProviderTestPageState();
}

class ProviderTestPageState extends State<ProviderTestPage> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context);
    return
      Scaffold(
          appBar:  AppBar(title: Text("priveder demo")),
          body: Container(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(counter.userName),
                Container(
                  color: Colors.yellow,
                  child: const SizedBox(height: 10)
                ),
                ElevatedButton(onPressed: () => {
                  Navigator.pushNamed(context, '/sec'),
                }, child: const Text("go sec page")),
                ElevatedButton(onPressed: () => {
                  Navigator.pushNamed(context, '/fir'),
                }, child: const Text("go fir page"))
              ]))
      );
  }

}