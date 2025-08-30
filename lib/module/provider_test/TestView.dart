import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  @override
  Widget build(BuildContext context) {
    print('print TestView build');
    return Container(width: 100,height: 100, color: Colors.red.shade50);
  }
}