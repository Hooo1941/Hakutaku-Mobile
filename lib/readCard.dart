import 'package:flutter/material.dart';
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
                final message = await MifareNfcClassic.readBlock(
                  blockIndex: 0,
                );
                await showToast(message);
              },
              child: Text('点击读取设备'),
            ),
          ],
        ),
      ),
    );
  }
}
