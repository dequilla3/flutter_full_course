import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/login_provider.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final focusUserName = FocusNode();
  final focusPassword = FocusNode();

  bool _isLoading = false;
  String _errMsg = "";

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });
  }

  void _stopLoading() async {
    setState(() {
      _isLoading = false;
    });
  }

  void _showErr(String err) async {
    setState(() {
      _errMsg = err;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _errMsg = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void doLogin() {
      final loginProvider = context.read<LoginProvider>();
      final appRepo = context.read<AppRepo>();

      focusUserName.unfocus();
      focusPassword.unfocus();

      loginProvider.username = usernameController.text;
      loginProvider.password = passwordController.text;

      _startLoading();

      Future.delayed(const Duration(seconds: 2), () {
        loginProvider.login().then((value) {
          _stopLoading();
          appRepo.user = value.user;
          appRepo.token = value.token;
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
        }, onError: (err) {
          _showErr(err.toString());
          _stopLoading();
          passwordController.clear();
        });
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Hello, welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to continue',
                  style: TextStyle(color: Colors.white),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errMsg.replaceAll('Exception:', ''),
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                ),
                AppTextField(
                  hint: "Username",
                  controller: usernameController,
                  focusNode: focusUserName,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextField(
                  hint: "Password",
                  controller: passwordController,
                  isObscureText: true,
                  focusNode: focusPassword,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                      child: const Text('Forgot password?')),
                ),

                // const Spacer(),

                // LOGIN BUTTON
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      doLogin();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Login'),
                        const SizedBox(width: 8),
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const SizedBox())
                      ],
                    ),
                  ),
                ),

                const Spacer(),

                const Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.white),
                ),

                const SizedBox(
                  height: 16,
                ),

                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google2.png',
                            width: 22,
                            height: 22,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('Login with Google')
                        ],
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 22,
                            height: 22,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('Login with Facebook')
                        ],
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.amber),
                        child: const Text(
                          'Sign up',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
