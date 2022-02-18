import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  // SharedPreferences sharedPref;
  final _storage = FlutterSecureStorage();
  AuthenticatedHttpClient();

  // Use a memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  String get userAccessToken {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = _loadTokenFromSharedPreference() as String;

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // intercept each call and add the Authorization header if token is available
    if (userAccessToken.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => userAccessToken);
    }

    return request.send();
  }

  Future<String> _loadTokenFromSharedPreference() async {
    var accessToken = '';
    // final user = sharedPref.getString(CACHED_USER);
    var user = await _storage.read(key: "user");

    // If user is already authenticated, we can load his token from cache
    accessToken = user;
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}