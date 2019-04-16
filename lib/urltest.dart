import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlTestPage extends StatefulWidget {
  @override
  _UrlTestPageState createState() => _UrlTestPageState();
}

class _UrlTestPageState extends State<UrlTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('open url'),
      ),
      body: FlatButton(
        child: Text('www.ocnyang.com'),
        onPressed: _openMyBlog,
      ),
    );
  }

  _openMyBlog() async {
    const url = 'http://ocnyang.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
