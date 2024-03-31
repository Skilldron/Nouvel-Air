import 'package:firebase_auth/firebase_auth.dart';
import 'package:nouvel_air/app/common/components/text_field.dart';
import 'package:nouvel_air/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'main_auth_button.dart';

class AuthForm extends StatefulWidget {
  final Future<void> Function({required String email, required String password})
      function;
  final String title;
  final Widget? child;

  const AuthForm(
      {super.key, required this.function, required this.title, this.child});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: styledTextField(
                controller: emailController,
                label: 'Email',
                isPassword: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                }),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: styledTextField(
                  controller: passwordController,
                  label: 'Mot de passe',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done)),
          widget.child ?? const SizedBox(),
          mainAuthButton(_isLoading, () async {
            if (_formKey.currentState!.validate()) {
              setState(() => _isLoading = true);
              await widget
                  .function(
                      email: emailController.text,
                      password: passwordController.text)
                  .then((value) =>
                      Navigator.canPop(context) ? Navigator.pop(context) : null)
                  .onError<FirebaseAuthException>((error, stackTrace) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: primaryTitle,
                          content:
                              Text(error.message ?? 'Something went wrong'))));
            }
            setState(() => _isLoading = false);
          }, widget.title),
        ],
      ),
    );
  }
}
