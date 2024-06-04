import 'package:motasimfuad_wedevs/src/core/network/endpoints.dart';
import 'package:motasimfuad_wedevs/src/core/network/network_services.dart';

class ProfileRepository {
  final NetworkService _networkService = NetworkService();

  Future<dynamic> userDetails() async {
    final response = await _networkService.post(
      Api.userDetails,
      {},
      needToken: true,
    );

    return response.data;
  }
}
