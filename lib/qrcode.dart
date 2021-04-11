//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'utils.dart';

Future scan() async {
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
  getScan(qrcode);
}

void getScan(String scan) async {
  if (scan == null || !scan.contains("baize://")) {
    await showToast("错误的二维码！");
    return;
  }
  // var url="http://baize.dev.builds.ninja/api/v1/Scan?scan="+scan;
  // var dio = Dio();
  // var response = await dio.get(url);
  // var data = response.data.toString();
  // print(data);
  await showToast(scan.replaceAll("baize://", ""));
}
