import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'api.dart';
import 'utils.dart';

Future<void> scan(BuildContext context) async {
  Map<Permission, PermissionStatus> result = await [
    Permission.camera,
    Permission.storage,
  ].request();
  if (result[Permission.camera] == PermissionStatus.denied ||
      result[Permission.storage] == PermissionStatus.denied ||
      result[Permission.camera] == PermissionStatus.permanentlyDenied ||
      result[Permission.storage] == PermissionStatus.permanentlyDenied) {
    await showToast("请授权摄像头访问权限");
    await openAppSettings();
    return;
  }

  String qrcode = await scanner.scan();

  if (qrcode == null || !qrcode.contains("hakutaku://")) {
    await showToast("错误的二维码！");
    return;
  }

  Navigator.pushNamed(context, '/scan',
      arguments: qrcode.replaceAll('hakutaku://', ''));
}

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('扫码登录'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('借出设备确认'),
            ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> resp = await passLoginToken(token);
                  if (resp['code'] != 0)
                    await showToast(resp['body']);
                  else
                    await showToast('登录成功');
                },
                child: Text('确认登录')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消'))
          ],
        ),
      ),
    );
  }
}
