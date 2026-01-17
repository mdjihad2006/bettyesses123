import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../log_in/controllers/log_in_controller.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final loginController = Get.find<LogInController>();

  Future<GoogleSignInAccount?> login() async {
    try {
      // Initialize first (required for Android)
      await _googleSignIn.initialize(
        serverClientId: '807564112618-jpaqqeb6rl1fk4a7q342jtfklrps7cmi.apps.googleusercontent.com',
      );

      // Authenticate
      if (_googleSignIn.supportsAuthenticate()) {
        final GoogleSignInAccount user = await _googleSignIn.authenticate();
        final auth = user.authentication;
        if (auth.idToken != null) {
          await loginController.loginWithGoogle(auth.idToken!);
        }
        return user;
            } else {
        print('Authenticate not supported on this platform.');
      }
    } catch (e) {
      print('Google Sign-In Error: $e');
    }
    return null;
  }
}