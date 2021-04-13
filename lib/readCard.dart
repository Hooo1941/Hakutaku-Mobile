import 'package:flutter/material.dart';
import 'package:hakutaku/api.dart';
import 'package:mifare_nfc_classic/mifare_nfc_classic.dart';

import 'utils.dart';

class ReadCardPage extends StatefulWidget {
  @override
  _ReadCardPageState createState() => _ReadCardPageState();
}

class _ReadCardPageState extends State<ReadCardPage> {
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('读取设备'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                String tag = await MifareNfcClassic.readBlock(
                  blockIndex: 0,
                );
                tag = tag.substring(0, 8).toLowerCase();
                Map<String, dynamic> resp = await doPrepare(tag);
                if (resp == null)
                  await showToast('网络错误');
                else if (resp['code'] != 0)
                  await showToast(resp['msg']);
                else {
                  await showToast('成功');
                  borrowCode = resp['body'].toString();
                  Navigator.popAndPushNamed(context, '/code');
                  return;
                }
                Navigator.pop(context);
              },
              child: Text('点击读取设备'),
            ),
          ],
        ),
      ),
    );
  }
}
