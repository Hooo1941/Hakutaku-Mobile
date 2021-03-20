import 'package:flutter/material.dart';
import 'package:mifare_nfc_classic/mifare_nfc_classic.dart';
import 'utils.dart';

class WriteCardPage extends StatefulWidget {
  @override
  _WriteCardPageState createState() => _WriteCardPageState();
}

class _WriteCardPageState extends State<WriteCardPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String message;
  var hasInformation = false;
  var listInformation = [0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('写入卡片'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: hasInformation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          initialValue: 'ID'.toUpperCase(),
                          onSaved: (newValue) => message = newValue,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: '写入信息',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        _formKey.currentState.save();
                        if (message.isEmpty) {
                          showToast(message: "Write Something");
                        } else {
                          await MifareNfcClassic.writeBlock(
                              blockIndex: 4, message: message);
                          await showToast(message: "写卡成功");
                        }
                      },
                      child: Text('写入'),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !hasInformation,
                child: TextButton(
                  onPressed: () async {
                    listInformation.clear();
                    listInformation.addAll(await buildInitialAlert(context));
                    setState(() {
                      hasInformation = !hasInformation;
                    });
                  },
                  child: Text('请先读卡'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
