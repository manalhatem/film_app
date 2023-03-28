
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

myDio({
  @required String? url,
  @required String? methodType,
  @required dynamic dioBody,
  @required Map<String, dynamic>? dioHeaders,
  @required String? appLanguage,
  required BuildContext? context
}) async {
  var response;
    try {
      if (methodType == 'get') {
        response = await Dio()
            .get(
          url!,
          queryParameters: dioBody,
          options: Options(
              headers: dioHeaders,
              validateStatus: (int? status) => status! >= 200 && status <= 500),
        )
            .catchError((onError) {
        });
      } else if (methodType == 'post') {
        response = await Dio()
            .post(url!,
            data: dioBody,
            options: Options(
                headers: dioHeaders,
                validateStatus: (int? status) =>
                status! >= 200 && status <= 500))
            .catchError((onError) {
        });
      }
      print('Response is >>> ' + response.statusCode.toString());

    } catch (e) {
      print('global Dio Error Weak Internet' + e.toString());
    }

}

