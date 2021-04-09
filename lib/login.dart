import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'utils.dart';
import 'qrcode.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WebView(
        initialUrl: 'http://10.132.10.184:8080/phone',
        javascriptMode: JavascriptMode.unrestricted,
        // javascriptChannels: [
        //   JavascriptChannel(
        //   name: 'App',
        //   onMessageReceived: (JavascriptMessage message) {
        //     showToast(message: message.message);
        //   })
        //   ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          // 拦截请求
          if (request.url.contains('phonesuccess')) {
            showToast(message: request.url);
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return ScanPage();
            }));
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
