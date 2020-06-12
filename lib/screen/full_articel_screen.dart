import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newspaper/widget/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticleScreen extends StatefulWidget {
  final String blogUrl;

  FullArticleScreen({this.blogUrl});

  @override
  _FullArticleScreenState createState() => _FullArticleScreenState();
}

class _FullArticleScreenState extends State<FullArticleScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
//        appBar: AppBar(
//          elevation: 0.0,
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[Text('News'), Text('Paper')],
//          ),
//        ),
        body: SafeArea(
          child: WebView(
            initialUrl: widget.blogUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.arrow_back_ios,
            ),
            backgroundColor: kBlue,
            elevation: 0.2,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
