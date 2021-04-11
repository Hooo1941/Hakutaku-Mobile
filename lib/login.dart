import 'package:flutter/material.dart';
import 'package:hakutaku/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'utils.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WebView(
        initialUrl: LoginURL,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // 拦截请求
          if (request.url.contains('manage')) {
            showToast(request.url.replaceFirst(FrontendURL + "/manage/#/", ""));
            Navigator.popAndPushNamed(context, '/manage');
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
