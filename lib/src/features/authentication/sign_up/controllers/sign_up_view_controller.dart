import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/cache/cache_service.dart';
import 'package:motasimfuad_wedevs/src/core/page_state/page_state.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/root/repositories/auth_repository.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/models/sign_in_response_model.dart';
import 'package:motasimfuad_wedevs/src/routes/app_pages.dart';

class SignUpViewController extends GetxController {
  final AuthenticationRepository _authRepository = AuthenticationRepository();

  final Rx<PageState> _pageStateController = Rx(PageState.initial);
  bool get isLoading => _pageStateController.value == PageState.loading;

  SignInResponseModel? signInResponseModel;
  CacheService cacheService = CacheService();

  Future<void> signUp() async {
    _pageStateController(PageState.loading);

    final data = {
      "username": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await _authRepository.signUp(data);
      if (response['code'] == 200) {
        Get.snackbar(
          'Success',
          'Account created successfully. Please login to continue.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      Get.offNamed(Routes.login);
      _pageStateController(PageState.success);
      _clearControllers();
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        String message = e.response?.data['message'];
        Get.snackbar(
          'Error',
          message,
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _clearControllers() {
    FocusScope.of(Get.context!).unfocus();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
