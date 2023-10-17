import 'package:field_service_app/config/storages.dart';
import 'package:field_service_app/controllers/auth_controller.dart';
import 'package:field_service_app/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<dynamic> post(String url, dynamic body) async {
  try {
    String token = MyApp().storage.read(tokenPath) ?? '';
    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    // inspect(response);
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      Get.put(AuthController()).logout();
    }
    // return response;

    return response;
  } catch (e) {
    return e.toString();
  }
}

Future<dynamic> get(String url) async {
  try {
    String token = MyApp().storage.read(tokenPath) ?? '';
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    // inspect(url);
    // inspect(response);

    if (response.statusCode == 401) {}
    if (response.statusCode == 200) {
      return response;
    }
    return null;
  } catch (e) {
    // inspect(e);
    return null;
  }
}

Future<dynamic> postWithJsonBody(String url, dynamic body) async {
  String token = MyApp().storage.read(tokenPath) ?? '';

  try {
    var response = await http.post(Uri.parse(url), body: body, headers: {
      "Accept": "application/json",
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $token"
    });
    return response;
  } catch (e) {
    return e;
  }
}

Future<dynamic> multirequestPost(dynamic request) async {
  String token = MyApp().storage.read(tokenPath) ?? '';
  try {
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = "Bearer $token";
    var res = await request.send();
    return res;
  } catch (e) {
    return null;
  }
}
