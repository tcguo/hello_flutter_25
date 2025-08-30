import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack"),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 40, top: 20, right: 15),
        child: Container(
          color: Colors.black26,
          width: double.infinity,
          child: Column(
            children: [
              Icon(Icons.star, size: 50),
              Icon(Icons.star, size: 200),
              Icon(Icons.star, size: 50),
            ],
          ),
        ),
      ),
    );
  }
}