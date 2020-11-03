import 'package:demo/discover/Company.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigatorTaskScreen extends StatelessWidget {
  final Company _company;

  NavigatorTaskScreen(this._company);

  @override
  Widget build(BuildContext context) {
    var url = _company.url;
    return Scaffold(
      appBar: AppBar(title: Text("webview")),
      body: WebView(
        initialUrl: url,
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }
}
