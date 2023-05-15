// ignore_for_file: file_names, avoid_renaming_method_parameters, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data/app_exception.dart';
import 'package:food_app/data/netwoks/baseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/utils/common_utils.dart/common_utils.dart';

class NetworkApiServices extends BaseApiServices {
  //--get-data-from-internet-----
  @override
  Future getApiResponse(BuildContext context, String url) async {
    dynamic jsonresponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonresponse = returnResponse(context, response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonresponse;
  }

  //--post-data-to-internet-----
  @override
  Future postApiResponse(
      BuildContext context, String url, dynamic bodyData) async {
    dynamic jsonresponse;
    try {
      final response = await http.post(Uri.parse(url), body: bodyData);
      jsonresponse = returnResponse(context, response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonresponse;
  }

  //-Response-handeling-----
  dynamic returnResponse(BuildContext context, http.Response response) {
    dynamic res = jsonDecode(response.body);
    if (kDebugMode) {
      print("statusCode = ${response.statusCode} \n body = ${response.body}");
    }
    if (response.statusCode == 200) {
      CommonUtils.getAnimatedSnackBar(context, "Sucess", true);
      return NetworkResponse(
        statusCode: response.statusCode,
        body: response.body.toString(),
      );
    } else if (response.statusCode == 400) {
      CommonUtils.getAnimatedSnackBar(context, res["error"].toString(), false);
      return NetworkResponse(
        statusCode: response.statusCode,
        body: BadRequestException(
          response.body.toString(),
        ),
      );
    } else if (response.statusCode == 404) {
      CommonUtils.getAnimatedSnackBar(context, res["error"].toString(), false);
      return NetworkResponse(
        statusCode: response.statusCode,
        body: BadRequestException(
          response.body.toString(),
        ),
      );
    } else if (response.statusCode == 500) {
      CommonUtils.getAnimatedSnackBar(context, "Server Error".toString(), false);
      return NetworkResponse(
        statusCode: response.statusCode,
        body: ServerException(response.body.toString(),),
      );
    } else {
      CommonUtils.getAnimatedSnackBar(
          context, "Error : ${response.statusCode}".toString(), false);
      return NetworkResponse(
        statusCode: response.statusCode,
        body: FetchDataException(
            "Error Occured during communication with server with status code = ${response.statusCode}"),
      );
    }
  }
}

class NetworkResponse {
  int statusCode;
  dynamic body;
  NetworkResponse({required this.statusCode, required this.body});
}
