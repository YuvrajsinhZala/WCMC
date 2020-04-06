import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<MyApp>{
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Web view'),
        ),
        body: WebView(
          initialUrl: "https://indianarmy.nic.in/Site/NewsDetail/frmNoticeDetails.aspx",
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
          controller) {
            if(controller.hasData){
              return FloatingActionButton(onPressed: null); 
            }
          },
        ),
      ),
    );
  }
}