import 'dart:convert';
import 'package:http/http.dart' as http;
import '/utils/constants.dart' as constants;

class UserProfileViewModel {

  Future<void> Signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('${constants.SERVER_URL}/user/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'FirstName': firstName,
        'LastName': lastName,
        'Email': email,
        'Password': password,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to signup');
    }
  }

  /* exemple mta request bel token
    final response = await http.post(
      Uri.parse('http://localhost:9090/user/register'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      }
  */


  //hedha tjibo mel user defaults eli nakhbiweh ghadi baad  el user login
   //final String accessToken;

}