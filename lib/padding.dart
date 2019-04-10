import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
//上下左右各添加16像素补白
        padding: EdgeInsets.all(16.0),
        child: Column(
//显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
//左边添加8像素补白
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Hello world"),
            ),
            Padding(
//上下各添加8像素补白
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("I am Jack"),
            ),
            Padding(
// 分别指定四个方向的补白
              padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
              child: Text("Your friend"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
