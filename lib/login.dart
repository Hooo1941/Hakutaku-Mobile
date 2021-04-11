import 'package:flutter/material.dart';
import 'package:hakutaku/api.dart';
import 'package:hakutaku/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WebView(
        initialUrl: LoginURL,
        onWebViewCreated: (WebViewController controller) async {
          String token = await secureStorage.read(key: 'token');
          if (token == null || token == '') return;

          var info = await getUserInfo(token);
          if (info['code'] != 0) {
            await secureStorage.delete(key: 'token');
            return;
          }

          userJwtToken = token;
          secureStorage.write(key: 'token', value: token);
          Navigator.popAndPushNamed(context, '/manage');
        },
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          // 拦截请求
          if (request.url.contains('manage')) {
            userJwtToken =
                request.url.replaceFirst(FrontendURL + '/manage/#/', '');
            secureStorage.write(key: 'token', value: userJwtToken);
            Navigator.popAndPushNamed(context, '/manage');
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
