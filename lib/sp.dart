import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TEXT_SAVE_KEY = "abcd";

class SPPage extends StatefulWidget {
  @override
  _SPPageState createState() => _SPPageState();
}

class _SPPageState extends State<SPPage> {
  String _oldString = "null";

  TextEditingController _textEditingController = TextEditingController();

  void _saveOrGetTextData(bool isSave) {
    if (isSave) {
      _saveDataModel(
          _textEditingController.value.text.toString() ?? "www.ocnyang.com");
    } else {
      _getDataModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据存储"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: '要存储的文本',
              hintText: '随便输入点东西',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
            controller: _textEditingController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => _saveOrGetTextData(true),
                child: Text('save'),
              ),
              RaisedButton(
                onPressed: () => _saveOrGetTextData(false),
                child: Text('get'),
              ),
            ],
          ),
          Text(_oldString)
        ],
      ),
    );
  }

  void _getDataModel() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _oldString = sharedPreferences.getString(TEXT_SAVE_KEY);
    });
  }
}

void _saveDataModel(String text) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(TEXT_SAVE_KEY, text);
}
