import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("好友"),
      ),
      body: Center(child: Text("好友界面", style: TextStyle(fontSize: 20))),
    );
  }
}
