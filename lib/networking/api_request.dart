import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:pos/networking/AppException.dart';

class ApiRequest extends ChangeNotifier {
  String baseUrl = "http://pos.hva.monster/api/";
  var header = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  dynamic responses(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(response);
        if(responseJson['statusCode'] == 200){
          return responseJson;
        }else{
          throw BadRequestException(response.body.toString());
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  Future<http.Response?> userSignUp(String mobile , String password,) async {
    try {
      var data = jsonEncode({
        "mobile": "776212671",
        "password": "111111"
      }
      );

      final response = await http.post(Uri.parse(baseUrl + "user/signup"), headers: header, body: data);
      return response;
    } on Exception catch (exception) {
      print("Exception $exception");
      return null;
    }
  }


}