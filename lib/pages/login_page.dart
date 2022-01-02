import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MASUK'),
        ),
        body: LoginFormWidget(),
      ),
    );
  }
}
