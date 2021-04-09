import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'utils.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("扫码"),
      ),
      body:Center(
        child: ElevatedButton(
          onPressed: scan,
          child: Text("扫一扫"),
        ),
      ),
    );
  }
}

//扫码函数,最简单的那种
Future scan() async {
  String cameraScanResult = await scanner.scan(); //通过扫码获取二维码中的数据
  getScan(cameraScanResult); //将获取到的参数通过HTTP请求发送到服务器
  print(cameraScanResult); //在控制台打印
}

//get请求，用于验证数据(也可以在控制台直接打印，但模拟器体验不好)
void getScan(String scan) async {
  // var url="http://164.155.66.12/GetScan?scan="+scan;
  // var dio = Dio();
  // var response = await dio.get(url);
  // var data = response.data.toString();
  // print(data);
  await showToast(message: scan);
}

//注：这里通过HTTP验证参数，所以需要使用dio库用于请求网络
//另:实际扫码的代码只有一行：String cameraScanResult = await scanner.scan();
//HTTP请求部份仅用于验证数据，应用在实际场景中则是把扫到的数据传给相应的接口
