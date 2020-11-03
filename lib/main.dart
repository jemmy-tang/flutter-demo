import 'package:demo/discover/DiscoverScreen.dart';
import 'package:demo/Friend/FriendScreen.dart';
import 'package:demo/manager/ManagerScreen.dart';
import 'package:demo/mine/MineScreen.dart';
import 'package:demo/provider/company_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        //数据模型注入
        ChangeNotifierProvider(
          create: (_) => CompanyListProvider(),
        )
      ],
      child: MyApp(),
    ));

//暗号：初见Flutter
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    FriendScreen(),
    DiscoverScreen(),
    ManagerScreen(),
    MineScreen()
  ];
  int currentIndex = 0;

  void handleTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: handleTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.child_friendly), label: "好友"),
            BottomNavigationBarItem(icon: Icon(Icons.description), label: "发现"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "管理"),
            BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "我的"),
          ]),
    );
  }
}
