import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: new Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    minHeight: 200,
                    minWidth: double.infinity,
                  ),
                  child: Image.network(
                    "https://images4.alphacoders.com/688/688388.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text('www.ocnyang.com',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal))
              ],
            ),
            Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 230),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "请输入用户名",
                        labelText: "用户名",
                        prefixIcon: Icon(Icons.account_box),
                        border: InputBorder.none),
                  ),
                  TextField(
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "请输入密码",
                        labelText: "密码",
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: forgetPwd,
                        child: Text("忘记密码?"),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: RaisedButton(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      color: Colors.redAccent,
                      onPressed: loginEvent,
                      textColor: Colors.white,
                      child: Text('登录'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void loginEvent() {}

  void forgetPwd() {}
}
