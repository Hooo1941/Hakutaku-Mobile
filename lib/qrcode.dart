//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'utils.dart';

// class ScanPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("扫码"),
//       ),
//       body:Center(
//         child: ElevatedButton(
//           onPressed: scan,
//           child: Text("扫一扫"),
//         ),
//       ),
//     );
//   }
// }

Future scan() async {
  String cameraScanResult = await scanner.scan();
  getScan(cameraScanResult);
  print(cameraScanResult);
}

void getScan(String scan) async {
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
