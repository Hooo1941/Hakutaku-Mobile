import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_verification_box/verification_box.dart';

import 'api.dart';
import 'utils.dart';

String returnTime;

class BorrowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    returnTime = DateTime.now().add(const Duration(days: 1)).toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('借入设备'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('借入设备', style: TextStyle(fontSize: 25)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (time) {
                        showToast(time.toString());
                        returnTime = time.toString();
                      }, currentTime: DateTime.now(), locale: LocaleType.zh);
                    },
                    child:
                        Text('选择归还时间', style: TextStyle(color: Colors.blue))),
              ),
              Container(
                height: 45,
                child: VerificationBox(
                  count: 6,
                  focusBorderColor: Colors.lightBlue,
                  textStyle: TextStyle(color: Colors.lightBlue),
                  showCursor: true,
                  onSubmitted: (value) async {
                    Map<String, dynamic> resp =
                        await doBorrow(value, returnTime);
                    if (resp == null)
                      await showToast('网络错误');
                    else if (resp['code'] != 0)
                      await showToast(resp['msg']);
                    else
                      await showToast('成功');
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
