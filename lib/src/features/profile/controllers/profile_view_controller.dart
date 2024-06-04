import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';
import 'package:motasimfuad_wedevs/src/core/page_state/page_state.dart';
import 'package:motasimfuad_wedevs/src/features/profile/models/user_model.dart';
import 'package:motasimfuad_wedevs/src/features/profile/repositories/profile_repository.dart';

class ProfileViewController extends GetxController {
  final ProfileRepository _profileRepository = ProfileRepository();
  final CacheService _cacheService = CacheService();

  final Rx<PageState> _pageStateController = Rx(PageState.initial);
  bool get profileIsLoading => _pageStateController.value == PageState.loading;

  UserModel? userDetails;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    _pageStateController(PageState.loading);
    try {
      final response = await _profileRepository.userDetails();
      userDetails = UserModel.fromJson(response);
      _cacheService.setUserResponse(response.toString());
      _pageStateController(PageState.success);
    } on DioException {
      Get.snackbar(
        'Error',
        'An error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      _pageStateController(PageState.error);
    }
  }
}
