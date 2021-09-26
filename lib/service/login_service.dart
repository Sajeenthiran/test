import 'package:pos/networking/api_request.dart';

class LoginService{
  final ApiRequest apiRequest = ApiRequest();

  Future<bool?> userSignUp(String mobile , String password,) async {
    try {
      var response = await apiRequest.userSignUp(mobile, password);


      var data = apiRequest.responses(response!);

      if(data['statusCode'] == 200){
        return true;
      } else {
        print("response body : "+response.toString());
        return false;
      }
    } on Exception catch (exception) {
      print("Exception $exception");
      return null;
    }
  }
}