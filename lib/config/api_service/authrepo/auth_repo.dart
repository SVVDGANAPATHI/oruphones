import 'package:logger/logger.dart';
import 'package:oruphones/config/api_service/authrepo/auth_cred.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<void> storetoken({accessToken, userName, cookie}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken ?? 'A');
    await prefs.setString('cookie', cookie?? 'A');
    await prefs.setString('username', userName??'A');
  }

  Future<AuthCred> gettokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? accesstoken = prefs.getString('accessToken');
    final String? username = prefs.getString('username');
    final String? cookie = prefs.getString('cookie');

    // if (accesstoken == null || username == null || accesstoken.isEmpty || username.isEmpty || cookie == null || cookie.isEmpty) {
    //   Logger().i('Tokens are missing');
    //   return const  AuthCred(accessToken: '', username: '', cookie: '');
    // }

    return AuthCred(accessToken: accesstoken??'', username: username??'', cookie: cookie??'',);
  }
}
