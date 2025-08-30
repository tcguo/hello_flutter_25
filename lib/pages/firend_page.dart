import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});
  final title1 = "";
  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("朋友页面"),
        centerTitle: true,
        backgroundColor: Colors.green[50],
      ),
      body: const Center(
        child: Text("朋友页面"),
      ),
    );
  }
}
