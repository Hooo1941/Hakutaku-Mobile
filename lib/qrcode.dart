//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'utils.dart';

Future scan() async {
  PermissionStatus p = await Permission.camera.request();
  if (!p.isGranted || p.isDenied || p.isPermanentlyDenied || p.isRestricted) {
    await showToast(message: "请授权摄像头访问权限");
    await openAppSettings();
    return;
  }

  String qrcode = await scanner.scan();
  getScan(qrcode);
  print(qrcode);
}

void getScan(String scan) async {
  if (scan == null) {
    return;
  }
  if (!scan.contains("baize://")) {
    await showToast(message: "错误的二维码！");
    return;
  }
  // var url="http://baize.dev.builds.ninja/api/v1/Scan?scan="+scan;
  // var dio = Dio();
  // var response = await dio.get(url);
  // var data = response.data.toString();
  // print(data);
  await showToast(message: scan.replaceAll("baize://", ""));
}
