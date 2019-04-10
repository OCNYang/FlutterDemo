import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.amberAccent,
        cardColor: Colors.white,
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
      body: Center(
          child: new ListView(
        children: list,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(color: Colors.amberAccent),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> list = <Widget>[
    new ListTile(
      title: new Text('CineArts at the Empire',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('85 W Portal Ave'),
      leading: new Icon(
        Icons.textsms,
        color: Colors.blue[500],
      ),
    ),
    new Divider(),
    new ListTile(
      title: new Text('The Castro Theater',
          style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text('429 Castro St'),
      isThreeLine: true,
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[500],
      ),
    ),
    new Divider(),
    new Card(
      elevation: 10,
      child: new ListTile(
        title: new Text('The Castro Theater',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
    )
  ];
}
