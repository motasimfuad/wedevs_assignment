import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  final Rx<PageState> _updateStateController = Rx(PageState.initial);
  bool get isProfileUpdating =>
      _updateStateController.value == PageState.loading;

  Rx<UserModel?> userDetails = (null as UserModel?).obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Future<void> getUserDetails() async {
    _pageStateController(PageState.loading);
    try {
      final response = await _profileRepository.userDetails();
      userDetails.value = UserModel.fromJson(response);
      _cacheService.setUserResponse(response.toString());
      assignFields();
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

  Future<void> updateProfile() async {
    _updateStateController(PageState.loading);
    final body = {
      'name': fullNameController.text,
      'email': emailController.text,
    };

    try {
      final response = await _profileRepository.updateProfile(
        userId: userDetails.value?.id,
        body: body,
      );
      userDetails.value = UserModel.fromJson(response);
      _cacheService.setUserResponse(response.toString());
      assignFields();
      _updateStateController(PageState.success);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        Get.snackbar(
          'Error',
          e.response?.data['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Profile update failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      _updateStateController(PageState.error);
    }
  }

  void assignFields() {
    emailController.text = userDetails.value?.email ?? '';
    fullNameController.text = userDetails.value?.name ?? '';
  }

  /// Text Editing Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
}
