import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';
import 'package:motasimfuad_wedevs/src/core/page_state/page_state.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/root/repositories/auth_repository.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/models/sign_in_response_model.dart';
import 'package:motasimfuad_wedevs/src/routes/app_pages.dart';

class SignInViewController extends GetxController {
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  final Rx<PageState> _pageStateController = Rx(PageState.initial);
  bool get isLoading => _pageStateController.value == PageState.loading;

  SignInResponseModel? signInResponseModel;
  CacheService cacheService = CacheService();

  Future<void> signIn() async {
    _pageStateController(PageState.loading);

    final data = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    try {
      final response = await _authRepository.signIn(data);
      signInResponseModel = SignInResponseModel.fromJson(response);
      if (signInResponseModel?.token != null) {
        await cacheService.setToken(signInResponseModel!.token!);
      }
      Get.offAllNamed(Routes.dashboard);
      _pageStateController(PageState.success);
      _clearControllers();
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        Get.snackbar(
          'Error',
          'The credentials provided are incorrect. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'An error occurred. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      _pageStateController(PageState.error);
    }
  }

  /// Controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _clearControllers() {
    FocusScope.of(Get.context!).unfocus();
    usernameController.clear();
    passwordController.clear();
  }
}
