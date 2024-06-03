import 'package:motasimfuad_wedevs/src/core/network/endpoints.dart';
import 'package:motasimfuad_wedevs/src/core/network/network_services.dart';

class AuthenticationRepository {
  final NetworkService _networkService = NetworkService();

  Future<dynamic> signIn(Map<String, dynamic> data) async {
    final response = await _networkService.post(
      Api.login,
      data,
    );
    return response.data;
  }
}
