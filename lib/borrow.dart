import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hakutaku/utils.dart';
//import 'package:dio/dio.dart';

String _bID;
String _time;

class BorrowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "请输入借取码："),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            maxLength: 4,
            onChanged: (value) {
              _bID = value;
            },
          ),
          TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context, showTitleActions: true,
                    onConfirm: (time) {
                  showToast(message: time.toString());
                  _time = time.toString();
                }, currentTime: DateTime.now(), locale: LocaleType.zh);
              },
              child: Text(
                '选择归还时间',
                style: TextStyle(color: Colors.blue),
              )),
          ElevatedButton(child: Text('提交'), onPressed: submit),
        ],
      ),
    ));
  }
}

void submit() async {
  // var url="http://baize.dev.builds.ninja/api/v1/borrow/borrow";
  // var dio = Dio();
  // var response = await dio.get(url);
  // var data = response.data.toString();
  // print(data);
  // format: "yyyy-mm-dd hh:mm:ss.000"
  if (_bID == "" || _time == "") {
    showToast(message: "请补全信息");
    return;
  }
  showToast(message: _bID + _time);
}
