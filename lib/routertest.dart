import 'package:flutter/material.dart';

import 'RouterPath.dart' show ROUTER_PATH_TEST;

class RouterTestPage extends StatefulWidget {
  @override
  _RouterTestPageState createState() => _RouterTestPageState();
}

class _RouterTestPageState extends State<RouterTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ROUTER_PATH_TEST);
            },
            child: Text('静态路由继续跳转'),
          ),
          RaisedButton(
            child: new Text('动态路由跳转'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => RouterTestPage()));
            },
          )
        ],
      )),
    );
  }
}
