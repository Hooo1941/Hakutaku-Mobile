import 'package:flutter/material.dart';
import 'qrcode.dart';
import 'readcard.dart';
import 'borrow.dart';

class ManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('借出设备'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadCardPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('借入设备'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BorrowPage()),
                );
              },
            ),
            ElevatedButton(child: Text('扫码'), onPressed: scan),
          ],
        ),
      ),
    );
  }
}
