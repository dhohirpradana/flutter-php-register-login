import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart' as getx;
import 'getx/get_auth.dart';

class Auth {
  static final userController = getx.Get.put(UserController());
  static final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    ),
  );
  static void signin(String username, String password) async {
    var formData = FormData.fromMap({
      // 'fullname': 'Dhohir Pradana',
      // 'email': 'dhohirkudus@gmail.com',
      'username': username,
      'password': password,
      // 'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
    });
    try {
      final response = await dio.post(BaseUrl.signin, data: formData);
      if (response.data['status'] == 1) {
        var usersData = response.data['data'] as List;
        // var user = getUsersData.map((i) => User.fromMap(i)).toList();
        var userModel = User.fromMap(usersData.asMap()[0]);
        userController.updateUser(userModel);
      } else {
        getx.Get.snackbar(
          "Gagal",
          response.data['message'],
          snackPosition: getx.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          isDismissible: false,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    } catch (e) {
      getx.Get.snackbar(
        "Error",
        "Koneksi internet buruk.",
        snackPosition: getx.SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: false,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
    Navigator.of(getx.Get.overlayContext!).pop();
  }

  static void signup(User user) async {
    var formData = FormData.fromMap({
      'username': user.username,
      'fullname': user.fullname,
      'email': user.email,
      'password': user.password,
    });
    try {
      final response = await dio.post(BaseUrl.signup, data: formData);
      if (response.data['status'] == 1) {
        signin(user.username, user.password);
        getx.Get.back();
      } else {
        getx.Get.snackbar(
          "Gagal",
          response.data['message'],
          snackPosition: getx.SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          isDismissible: false,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Navigator.of(getx.Get.overlayContext!).pop();
      }
    } catch (e) {
      getx.Get.snackbar(
        "Error",
        "Koneksi internet buruk.",
        snackPosition: getx.SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: false,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      Navigator.of(getx.Get.overlayContext!).pop();
    }
  }

  static void signout() {
    userController.updateUser(null);
  }
}
