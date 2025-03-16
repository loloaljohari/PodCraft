import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:podcraft/core/static/Url.dart';

class SignUpmodel extends GetxController{


var isloading=false.obs;


  Future<bool> registerUser(
      {required firstName,
      required lastName,
      required email,
      required password,
      required confirmpassword}) async {
    isloading.value=true;
    var request = http.MultipartRequest(
        'POST', Uri.parse('$url/users/register'));
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['password_confirmation'] = confirmpassword;

   
    final response = await request.send();
   
    var responsebody = await http.Response.fromStream(response);
isloading.value=false;
    if (response.statusCode == 201) {
      print('user');
            // User registered successfully
      return true;
    } else {
      print(response.statusCode);
      print(responsebody.body);
      // Failed to register user
      return false;
    }
  }


}