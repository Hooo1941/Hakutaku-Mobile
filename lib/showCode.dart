import 'package:flutter/material.dart';

import 'utils.dart';

class CodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('借出代码'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(borrowCode,
                style: TextStyle(fontSize: 48, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
