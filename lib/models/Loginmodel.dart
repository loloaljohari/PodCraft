import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:podcraft/core/static/Url.dart';

class Loginmodel extends GetxController {
  var isloading = false.obs;

  Future<bool> Login({
    required email,
    required password,
  }) async {
    isloading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse('$url/users/login'));
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields["fcm_token"]="null";
    request.fields['remember_me']="true" ;
    final response = await request.send();

    isloading.value = false;
    var responsebody = await http.Response.fromStream(response);

    isloading.value = false;
    if (response.statusCode == 200) {
      var token = jsonDecode(responsebody.body);
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // await pref.setString('token', token['data']['token']);

      print(responsebody.body);

      print('user');
      // User registered successfully
      return true;
    } else {
      print(response.statusCode);
      print(responsebody.body);
      return false;
    }
  }
}
