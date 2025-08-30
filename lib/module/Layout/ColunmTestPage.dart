import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColunmTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack"),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 40, top: 20, right: 15),
        child: Container(
          color: Colors.black26,
          width: double.infinity,
          height: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: Colors.red,
                  child: const SizedBox(width: 50, height: 100)
              ),
              Container(
                  color: Colors.yellow,
                  child: const SizedBox(width: 100, height: 150)
              ),
              Container(
                  color: Colors.blue,
                  child: const SizedBox(width: 200, height: 200)
              ),
            ],
          ),
        ),),
    );
  }
}