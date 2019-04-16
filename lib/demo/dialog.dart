import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dialogpage extends StatefulWidget {
  @override
  _dialogpageState createState() => _dialogpageState();
}

class _dialogpageState extends State<dialogpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("弹窗"),
        ),
        body: new Builder(builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Tooltip(
                message: "长按我就出来拉",
                child: FlatButton(
                  color: Colors.redAccent,
                  child: Text('tooltip'),
                ),
              ),
              RaisedButton(
                child: Text("SnackBar"),
                onPressed: () => onClickForShowSnackBar(context),
              ),
              GestureDetector(
                child: Text(
                  'Dialog',
                ),
                onLongPress: () {
                  showSimpleDialog(context);
                },
              ),
              RaisedButton(
                child: Text("Cupertino AlertDialog"),
                onPressed: () => showiOSDialog(context),
              ),
              MaterialButton(
                onPressed: () {
                  showBottomSheetDialog(context);
                },
                child: Text('Bottom Sheet'),
              ),
              MaterialButton(
                onPressed: () {
                  showBottomSheetDialog(context, isNotModal: false);
                },
                child: Text('Bottom Modal Sheet'),
              )
            ],
          );
        }));
  }

  void onClickForShowSnackBar(BuildContext context) {
    var snackBar = new SnackBar(
      content: new Text('看什么看，再看~ 再看就把你吃掉！'),
      action: SnackBarAction(
        label: "关闭",
        onPressed: () {},
        textColor: Colors.white,
      ),
      backgroundColor: Colors.grey,
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        child: SimpleDialog(
          title: Text('我是小仙女'),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 25, right: 25, top: 15),
          children: <Widget>[
            Text('无敌可爱，超甜的小仙女就是我，我就是小仙女'),
            FlatButton(
              child: Text('点赞'),
            )
          ],
        ));
  }

  void showBottomSheetDialog(BuildContext context, {bool isNotModal = true}) {
    var column = Column(
      children: <Widget>[
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
        Text('jssjss'),
      ],
    );

    var dBox = DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: column,
    );

    var cBox = ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: double.infinity, minWidth: double.infinity),
      child: dBox,
    );

    var opa = Opacity(
      opacity: 0.2,
      child: cBox,
    );

    if (isNotModal) {
      showBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return opa;
          });
    } else {
      showModalBottomSheet(
          context: context, builder: (BuildContext context) => opa);
    }
  }
}

showiOSDialog(BuildContext context) {
  var iOSDialog = CupertinoAlertDialog(
    title: Text('iOS弹窗'),
    content: Text('我是不是比Android那个逗比漂亮很多啊'),
    actions: <Widget>[
      FlatButton(
        child: Text('呸，小渣渣'),
        onPressed: () {},
      ),
      CupertinoDialogAction(
        child: Text('丫丫个呸'),
        onPressed: () {},
      )
    ],
  );
  showDialog(context: context, child: iOSDialog);
}
