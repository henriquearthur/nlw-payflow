import 'package:get_it/get_it.dart';
import 'package:payflow/shared/models/user.dart';
import 'package:payflow/shared/services/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  User? _user;

  User get user => _user!;

  void setUser(User? user) {
    if (user != null) {
      _user = user;
      saveCurrentUser(user);

      _navigateToHome();
    } else {
      removeCurrentUser();
      _navigateToLogin();
    }
  }

  Future<void> saveCurrentUser(User user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', user.toJson());

    return;
  }

  Future<void> loadCurrentUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("user")) {
      final json = sharedPreferences.get('user') as String;

      setUser(User.fromJson(json));
    } else {
      setUser(null);
    }

    return;
  }

  Future<void> removeCurrentUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey('user')) {
      await sharedPreferences.remove('user');
    }

    return;
  }

  void _navigateToHome() => GetIt.I
      .get<NavigatorService>()
      .currentState!
      .pushReplacementNamed('/home');

  void _navigateToLogin() => GetIt.I
      .get<NavigatorService>()
      .currentState!
      .pushReplacementNamed('/login');
}
