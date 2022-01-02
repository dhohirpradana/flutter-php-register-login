// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/auth_services.dart';
import 'package:flutter_application_1/services/validator/text_validator.dart';
import 'package:get/get.dart';

class SignupFormWidget extends StatelessWidget {
  SignupFormWidget({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                } else if (value.length < 6) {
                  return 'Minimal 6 karakter';
                }
                return null;
              },
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Masukan username',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                }
                return null;
              },
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                hintText: 'Masukan nama lengkap',
                icon: Icon(Icons.accessibility_new_sharp),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                } else if (!value.isValidEmail()) {
                  return 'Periksa penulisan email';
                }
                return null;
              },
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Masukan email',
                icon: Icon(Icons.mail),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Tidak boleh kosong';
                } else if (value.length < 6) {
                  return 'Minimal 6 karakter';
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
                  backgroundColor: MaterialStateProperty.all(Colors.green),
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
                  Auth.signup(
                    User(
                        fullname: namaController.text,
                        username: usernameController.text,
                        email: emailController.text,
                        password: passwordController.text),
                  );
                }
              },
              child: const Text('DAFTAR'),
            ),
            const Text(
              'atau',
              style: TextStyle(color: Colors.black54),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(Get.width, 40))),
              onPressed: () {
                Get.back();
              },
              child: const Text('MASUK'),
            ),
          ],
        ),
      ),
    );
  }
}
