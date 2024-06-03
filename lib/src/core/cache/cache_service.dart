import 'package:get_storage/get_storage.dart';

class CacheService {
  static final CacheService _cacheService = CacheService._internal();

  factory CacheService() {
    return _cacheService;
  }

  CacheService._internal();

  Future<void> initialize() async {
    await GetStorage.init();
  }

  static final _box = GetStorage();
  static const _token = "token";
  static const _user = "user";

  String? getToken() {
    return _box.read(_token);
  }

  Future<void> setToken(String token) async {
    await _box.write(_token, token);
  }

  String? getUserResponse() {
    return _box.read(_user);
  }

  void setUserResponse(String userResponse) {
    _box.write(_user, userResponse);
  }

  void clear() {
    _box.erase();
  }
}
