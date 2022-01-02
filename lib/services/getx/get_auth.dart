import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final box = GetStorage();
  User? user;
  void updateUser(User? data) {
    user = data;
    update();
    box.write('user', user);
  }
}
