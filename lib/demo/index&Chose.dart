import 'package:flutter/material.dart';

import 'dialog.dart';

class IndexAndChosePage extends StatefulWidget {
  @override
  _IndexAndChosePageState createState() => _IndexAndChosePageState();
}

class _IndexAndChosePageState extends State<IndexAndChosePage> {
  double _currentIndex = 0.0;

  void _onStateChanged(double value) {
    setState(() {
      _currentIndex = value;
    });
  }

  bool _isChecked = false;

  void _onCheckedChanged(bool currentChecked) {
    setState(() {
      _isChecked = currentChecked;
    });
  }

  int _groupValue = 0;
  String _sex = '男';

  void _onRadioChanged(int value) {
    setState(() {
      _groupValue = value;
    });
  }

  void _onSexRadioChanged(String value) {
    setState(() {
      _sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 5,
            value: 0.8,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.amber),
            semanticsValue: 'djdjd',
            semanticsLabel: 'aaaa',
          ),
          LinearProgressIndicator(
//            value: 0.8,
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.amber),
            semanticsValue: 'djdjd',
            semanticsLabel: 'aaaa',
          ),
          Slider(value: 0.4, onChanged: null),
          Slider(
              value: _currentIndex,
              label: '星期${(_currentIndex * 10).floor().toString()}',
              min: 0.0,
              max: 0.7,
              divisions: 7,
              onChanged: (double value) {
                _onStateChanged(value);
              }),
          Checkbox(
            value: _isChecked,
            onChanged: _onCheckedChanged,
          ),
          Checkbox(
            value: _isChecked,
            onChanged: _onCheckedChanged,
            checkColor: Colors.red,
            activeColor: Colors.green,
          ),
          Switch(value: _isChecked, onChanged: _onCheckedChanged),
          Switch(
            value: _isChecked,
            onChanged: _onCheckedChanged,
            activeColor: Colors.green,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.greenAccent,
            inactiveTrackColor: Colors.pink,
            inactiveThumbImage: AssetImage('images/man.jpeg'),
            activeThumbImage: AssetImage('images/woman.jpeg'),
          ),
          Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
              Radio(
                  value: 1,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
              Radio(
                  value: 2,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
              Radio(
                  value: 3,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
              Radio(
                  value: 4,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
              Radio(
                  value: 5,
                  groupValue: _groupValue,
                  onChanged: _onRadioChanged),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(
                value: '男',
                groupValue: _sex,
                onChanged: _onSexRadioChanged,
                activeColor: Colors.green,
              ),
              Radio(
                  value: '女', groupValue: _sex, onChanged: _onSexRadioChanged),
              Radio(
                  value: '中性', groupValue: _sex, onChanged: _onSexRadioChanged),
            ],
          )
        ],
      ),
    );
  }
}
