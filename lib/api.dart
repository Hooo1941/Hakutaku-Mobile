import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hakutaku/utils.dart';

import 'constants.dart';

Future<Map<String, dynamic>> getUserInfo(String token) async {
  try {
    var response = await Dio().get(BackendURL + '/user/info',
        options: Options(headers: {'token': token}));
    if (response.statusCode != HttpStatus.ok) return null;
    return response.data;
  } catch (err) {
    print('Error: ' + err.toString());
    return null;
  }
}

Future<Map<String, dynamic>> passLoginToken(String qrToken) async {
  try {
    var response = await Dio().post(BackendURL + '/scan/passToken',
        data: {'token': qrToken},
        options: Options(
            headers: {'token': userJwtToken},
            contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode != HttpStatus.ok) return null;
    return response.data;
  } catch (err) {
    print('Error: ' + err.toString());
    return null;
  }
}

Future<Map<String, dynamic>> doBorrow(String code, String time) async {
  try {
    var response = await Dio().post(BackendURL + '/borrow/request',
        data: {'code': code, 'time': time},
        options: Options(
            headers: {'token': userJwtToken},
            contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode != HttpStatus.ok) return null;
    return response.data;
  } catch (err) {
    print('Error: ' + err.toString());
    return null;
  }
}

Future<Map<String, dynamic>> doPrepare(String tag) async {
  try {
    var response = await Dio().post(BackendURL + '/borrow/prepare',
        data: {'tag': tag},
        options: Options(
            headers: {'token': userJwtToken},
            contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode != HttpStatus.ok) return null;
    return response.data;
  } catch (err) {
    print('Error: ' + err.toString());
    return null;
  }
}
