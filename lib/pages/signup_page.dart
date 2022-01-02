import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/signup_form_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DAFTAR'),
        ),
        body: SignupFormWidget(),
      ),
    );
  }
}
