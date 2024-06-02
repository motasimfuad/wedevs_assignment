class Api {
  static const baseUrl = 'http://apptest.dokandemo.com/wp-json';

  static const login = '$baseUrl/jwt-auth/v1/token';
  static const signup = '$baseUrl/wp/v2/users/register';
  static const userDetails = '$baseUrl/wp/v2/users/me';
  static const updateProfile = '$baseUrl/wp/v2/users/';
}
