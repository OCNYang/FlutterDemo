import 'package:flutter/material.dart';
import 'package:flutter_demo_app/Grid.dart';
import 'package:flutter_demo_app/padding.dart';
import 'package:flutter_demo_app/routertest.dart';
import 'package:flutter_demo_app/sp.dart';
import 'package:flutter_demo_app/urltest.dart';
import 'RouterPath.dart';
import 'demo/dialog.dart';
import 'demo/index&Chose.dart';
import 'demo/login/login.dart';
import 'filesave.dart';
import 'list1.dart';
import 'list2.dart';
import 'page.dart';
import 'List.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        ROUTER_PATH_TEST: (_) => new RouterTestPage(),
      },
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            addActionBtn(context, "Padding Page", new PaddingPage()),
            addActionBtn(context, "List Page", new ListPage()),
            addActionBtn(context, "Grid Page", new Grid()),
            addActionBtn(context, "Page", new Page()),
            addActionBtn(context, "Login", new LoginPage()),
            addActionBtn(context, "Open Web", new UrlTestPage()),
            addActionBtn(context, "Dialog", new dialogpage()),
            Row(
              children: <Widget>[
                addActionBtn(context, "SP Save", new SPPage()),
                addActionBtn(context, "File Save", new FileSavePage()),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ROUTER_PATH_TEST);
              },
              child: Text('静态路由跳转'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                addActionBtn(context, 'list1', new List1Page()),
                addActionBtn(context, 'list2', new List2Page()),
                addActionBtn(context, 'list1', new List1Page()),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  RaisedButton addActionBtn(
      BuildContext context, String btnStr, Widget skipPage) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => skipPage));
      },
      child: new Text(btnStr),
    );
  }
}
