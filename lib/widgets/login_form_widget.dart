// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                }
                return null;
              },
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Email / Username',
                hintText: 'Masukan email / username',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Masukan password',
                icon: Icon(Icons.tag),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(Get.width, 40))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return WillPopScope(
                        onWillPop: () => Future.value(false),
                        child: const AlertDialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          content: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  );
                  Auth.signin(usernameController.text, passwordController.text);
                }
              },
              child: const Text('MASUK'),
            ),
            const Text(
              'atau',
              style: TextStyle(color: Colors.black54),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  minimumSize: MaterialStateProperty.all(Size(Get.width, 40))),
              onPressed: () {
                Get.to(() => const SignupPage());
              },
              child: const Text('DAFTAR'),
            ),
          ],
        ),
      ),
    );
  }
}
