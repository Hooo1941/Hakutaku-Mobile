import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mifare_nfc_classic/mifare_nfc_classic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String FrontendURL = "http://baize.dev.builds.ninja";
const String BackendURL = "http://baize.dev.builds.ninja:7070";
const String LoginURL = BackendURL + "/api/v1/sso/login";

Future<List<int>> buildInitialAlert(BuildContext context) async {
  final listInfo = <int>[];
  final _alert = Alert(
    context: context,
    title: '读卡',
    desc: '把卡贴在手机上2次',
    buttons: [],
  );
  _alert.show();
  listInfo.add(await MifareNfcClassic.sectorCount);
  listInfo.add(await MifareNfcClassic.blockCount);
  _alert.dismiss();
  return listInfo;
}

Future<void> showToast(String message) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
