import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'utils.dart';
import 'manage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WebView(
        initialUrl: frontURL,
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
          if (request.url.contains('manage')) {
            showToast(
                message: request.url.replaceFirst(frontURL + "/manage/#/", ""));
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return ManagePage();
            }));
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
