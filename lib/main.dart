import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'services/getx/get_auth.dart';
import 'pages/home_page.dart';
import 'services/getx/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  final user = await boxUser();
  runApp(
    MyApp(user: user),
  );
}

class MyApp extends StatelessWidget {
  final User? user;
  MyApp({Key? key, required this.user}) : super(key: key);

  final userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetBuilder<UserController>(
        builder: (_) => (userController.user != null)
            ? HomePage(
                user: userController.user!,
              )
            : const LoginPage(),
      ),
    );
  }
}
