import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hakutaku/constants.dart';

Future<Map<String, dynamic>> getUserInfo(String token) async {
  var response = await Dio().get(BackendURL + '/user/info',
      options: Options(headers: {'token': token}));
  if (response.statusCode != HttpStatus.ok) return null;
  return response.data;
}
