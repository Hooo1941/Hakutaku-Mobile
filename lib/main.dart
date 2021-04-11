import 'package:flutter/material.dart';

import 'login.dart';
import 'manage.dart';
import 'readCard.dart';
import 'borrow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
    );
  }
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/manage': (context) => ManagePage(),
        '/readCard': (context) => ReadCardPage(),
        '/borrow': (context) => BorrowPage(),
      },
      initialRoute: '/login',
    );
  }
}
