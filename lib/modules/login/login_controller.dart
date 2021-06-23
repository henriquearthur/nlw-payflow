import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user.dart';

class LoginController {
  Future<void> googleSignIn() async {
    final authController = GetIt.I<AuthController>();

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );

    try {
      final response = await _googleSignIn.signIn();

      final user = User(
        name: response!.displayName!,
        email: response.email,
        photoURL: response.photoUrl,
      );

      authController.setUser(user);
    } catch (error) {
      authController.setUser(null);
    }
  }
}
