import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mifare_nfc_classic/mifare_nfc_classic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// String frontURL = "http://baize.dev.builds.ninja";
// String backURL = "http://baize.dev.builds.ninja:7070";
String frontURL = "http://10.133.216.38:8080";
String backURL = "http://10.133.216.38:7070";

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

Future<void> showToast({@required String message}) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}
