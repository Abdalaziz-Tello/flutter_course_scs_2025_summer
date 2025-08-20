import 'package:auth_flow/main.dart';
import 'package:auth_flow/model/user_model.dart';
import 'package:dio/dio.dart';

  String token = "";
class AuthService {
  Dio dio = Dio();
  String baseUrl = "https://dummyjson.com/auth/login";
  late Response response;

  Future<bool> login(String username, String password) async {
    try {
      response = await dio.post(
        baseUrl,
        data: {"username": username, "password": password},
      );
      token = response.data['accessToken'];
      simlpeStorgae.setString("token",token);
      print(response.data['accessToken']);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getProfile() async {
    try {
      response = await dio.get(
        "https://dummyjson.com/auth/me",
        options: Options(headers: {'Authorization': 'Bearer ${simlpeStorgae.getString("token")}'}),
      );
      print(response);
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
