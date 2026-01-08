import 'package:flutter/material.dart';

class ColumnTestPage extends StatefulWidget {
  const ColumnTestPage({super.key});

  @override
  State<ColumnTestPage> createState() => _ColumnTestPageState();
}

class _ColumnTestPageState extends State<ColumnTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("column test")),
      body: Container(
        child: Text("dd")
      ),
    );
  }
}
