import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理"),
      ),
      body: Center(child: Text("管理界面", style: TextStyle(fontSize: 20))),
    );
  }
}
