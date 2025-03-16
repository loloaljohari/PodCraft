import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:podcraft/core/static/Url.dart';

class Verifymodel extends GetxController {
  var isloading = false.obs;

  Future<bool> verify({
    required code,
    required email,
  }) async {
    isloading.value = true;
    var request =
        http.MultipartRequest('POST', Uri.parse('$url/users/emailVerify'));
    request.fields['email'] = email;
    request.fields['otp'] = code;

    final response = await request.send();

    var responsebody = await http.Response.fromStream(response);
    isloading.value = false;
    if (response.statusCode == 200) {
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
