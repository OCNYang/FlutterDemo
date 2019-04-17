import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileSavePage extends StatefulWidget {
  @override
  _FileSavePageState createState() => _FileSavePageState();
}

class _FileSavePageState extends State<FileSavePage> {
  TextEditingController _textEdingContro = TextEditingController();
  String _readStr = "nothing";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "输入要存储的文本",
                hintText: "随意输入一些文字",
                border: InputBorder.none),
            controller: _textEdingContro,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              FlatButton(
                onPressed: _saveStrToFile,
                child: Text("save"),
              ),
              Spacer(
                flex: 1,
              ),
              FlatButton(
                onPressed: _getStrFromFile,
                child: Text("get"),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Text(_readStr),
        ],
      ),
    );
  }

  void _saveStrToFile() async {
    final file = await getFile('strFile.text');
    file.writeAsStringSync(_textEdingContro.value.text.toString());
  }

  Future<File> getFile(String fileName) async {
    final fileDir = await getApplicationDocumentsDirectory();
    final filePath = fileDir.path;
    return new File(filePath + "/" + fileName);
  }

  void _getStrFromFile() async {
    final file = await getFile('strFile.text');
    final filePath = file.path;
    setState(() {
      file.readAsString().then((String str) {
        _readStr = str;
      });
    });
  }
}
