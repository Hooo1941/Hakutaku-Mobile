import 'package:flutter/material.dart';

import 'qrcode.dart';

class ManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakutaku'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('借出设备'),
              onPressed: () {
                Navigator.pushNamed(context, '/readCard');
              },
            ),
            ElevatedButton(
              child: Text('借入设备'),
              onPressed: () {
                Navigator.pushNamed(context, '/borrow');
              },
            ),
            ElevatedButton(
                child: Text('扫码'),
                onPressed: () async {
                  await scan(context);
                }),
          ],
        ),
      ),
    );
  }
}
