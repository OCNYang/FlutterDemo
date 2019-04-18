import 'package:flutter/material.dart';

class List2Page extends StatefulWidget {
  @override
  _List2PageState createState() => _List2PageState();
}

class _List2PageState extends State<List2Page> {
  List<ItemEntity> list = new List<ItemEntity>();
  var _scrollController = new ScrollController();


  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      list.add(ItemEntity('小仙女点赞+$i', Icons.adb));
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: RefreshIndicator(
            displacement: 50,
            color: Colors.redAccent,
            backgroundColor: Colors.blue,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == list.length) {
                  return LoadMoreView();
                } else {
                  return ItemView(list[index]);
                }
              },
              itemCount: list.length+1,
              controller: _scrollController,
            ),
            onRefresh: _onRefreshListView));
  }

  Future<void> _onRefreshListView() {
    setState(() {
      list.clear();
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
      list.add(ItemEntity("bbbbb", Icons.add));
      list.add(ItemEntity("aaaaaa", Icons.access_alarm));
      list.add(ItemEntity("aaaaaa", Icons.backspace));
      list.add(ItemEntity("aaaaaa", Icons.backup));
      list.add(ItemEntity("aaaaaa", Icons.account_box));
    });
  }

  void _getMoreData() {

  }
}

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Row(children: <Widget>[
          new CircularProgressIndicator(),
          Padding(padding: EdgeInsets.all(10)),
          Text('加载中...')
        ], mainAxisAlignment: MainAxisAlignment.center,),
      ),
    ), color: Colors.white70,);
  }
}

class ItemView extends StatelessWidget {
  ItemEntity itemEntity;

  ItemView(this.itemEntity);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(itemEntity.icon),
          Text(itemEntity.title),
        ],
      ),
    );
  }
}

class ItemEntity {
  String title;
  IconData icon;

  ItemEntity(this.title, this.icon);
}
