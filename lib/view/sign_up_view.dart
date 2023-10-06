import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/res/components/round_button.dart';
import 'package:flutter_mvvm_example/utils/utils.dart';
import 'package:flutter_mvvm_example/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign UP"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailTEController,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.alternate_email),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              SizedBox(
                height: height * .01,
              ),
              ValueListenableBuilder(
                valueListenable: obscureText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordTEController,
                    focusNode: passwordFocusNode,
                    obscureText: obscureText.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      prefixIcon: const Icon(Icons.lock_open_outlined),
                      hintText: 'Password',
                      suffixIcon: InkWell(
                        onTap: () {
                          obscureText.value = !obscureText.value;
                          setState(() {});
                        },
                        child: obscureText.value
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              RoundButton(
                title: "Sign UP",
                isLoading: authModel.isLoading,
                onTap: () {
                  if (emailTEController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please Enter Email", context);
                  } else if (passwordTEController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Please Enter Password", context);
                  } else {
                    Map<String, dynamic> loginData = {
                      "email": emailTEController.text.trim(),
                      "password": passwordTEController.text.trim(),
                    };

                    authModel.signUpApi(loginData, context);
                    if (kDebugMode) {
                      print("Api Hit");
                    }
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Have a account? Login"))
            ],
          ),
        ),
      ),
    );
  }
}
