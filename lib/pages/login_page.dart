import 'package:flutter/material.dart';

import '../const/const.dart';
import '../widgets/widgets.dart';

/*
page animation 
regexp
mixin

regular expression
https://www.geeksforgeeks.org/how-to-validate-a-password-using-regular-expressions-in-java/
*/
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.kCard, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.8,
            //         height: 200,
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomIcon(),
                  CustomTextFormField(
                    label: 'Email',
                    suffixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'Password should be atleast 8 character';
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    onPress: () {
                      if (_loginFormKey.currentState!.validate()) {
                        print('woooooooooooooooooooooooo');
                      }
                    },
                    text: 'Login',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
