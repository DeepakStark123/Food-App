// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class BaseApiServices {
  Future<dynamic> getApiResponse(BuildContext context, String url);
  Future<dynamic> postApiResponse(BuildContext context,String url,dynamic body);
}