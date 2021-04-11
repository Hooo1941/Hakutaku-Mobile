import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hakutaku/utils.dart';

import 'constants.dart';

Future<Map<String, dynamic>> getUserInfo(String token) async {
  var response = await Dio().get(BackendURL + '/user/info',
      options: Options(headers: {'token': token}));
  if (response.statusCode != HttpStatus.ok) return null;
  return response.data;
}

Future<Map<String, dynamic>> passLoginToken(String qrToken) async {
  var response = await Dio().post(BackendURL + '/scan/passToken',
      data: {'token': qrToken},
      options: Options(
          headers: {'token': userJwtToken},
          contentType: Headers.formUrlEncodedContentType));
  if (response.statusCode != HttpStatus.ok) return null;
  return response.data;
}
