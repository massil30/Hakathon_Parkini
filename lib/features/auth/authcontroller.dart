import 'package:http/http.dart' as http;
import 'package:sikada/features/auth/user_model.dart';

class AuthService {
  Future<http.Response> signIn(User_Model user) async {
    try {
      final url = Uri.parse(
        'https://proassur2.gam.dz/PROASSUR_API/api/v2/SecGam/loginAgentGam?user=${user.user}&pass=${user.password}',
      ); // Replace with your endpoint
      final response = await http.post(
        url,
        headers: <String, String>{
          'x-api-key': '5zbqemsxzn34v63ywf4uepb3n', // Replace with your API key
        },
      );
      return response;
    } catch (e) {
      return Future.error("Error during sign in: $e");
    }
  }

  Future<http.Response> signUp(User_Model user) async {
    try {
      final url = Uri.parse(
        'https://proassur2.gam.dz/PROASSUR_API/api/v2/SecGam/loginAgentGam?user=${user.user}&pass=${user.password}',
      ); // Replace with your endpoint
      final response = await http.post(
        url,
        headers: <String, String>{
          'x-api-key': '5zbqemsxzn34v63ywf4uepb3n', // Replace with your API key
        },
      );
      return response;
    } catch (e) {
      return Future.error("Error during sign in: $e");
    }
  }
}
