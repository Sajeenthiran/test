import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance = MySharedPreferences._privateConstructor();
  MySharedPreferences();
  /*login - isLogin
  *
  *
  * */

  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  setUserData(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  Future<String> getUserData(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "n/l";
  }


  Future<String> getUserFullName() async {
    //SharedPreferences myPrefs = await SharedPreferences.getInstance();
    String fullName = await getUserData("firstName") + " "+await getUserData("surName");

    return fullName;
  }


  setIsLogin(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getIsLogin(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }

  clear()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}