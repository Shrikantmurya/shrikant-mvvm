import 'package:flutter/material.dart';
import '/utils/color.dart';
import '../res/widget/customTextField.dart';
import '../res/widget/passwordField.dart';
import '../res/widget/round_button.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view/home_screen.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/text_styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .1,
            ),
            SvgPicture.asset(
              'assets/images/logo.png',
              height: 100,
            ),
            const Align(
              child: Text('Wepora MVVM', style: LoginHeaderStyle),
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              controller: _emailController,
              type: TextInputType.emailAddress,
              hint: "Email",
            ),
            PasswordField(
              controller: _passwordController,
              type: TextInputType.visiblePassword,
              hint: "Password",
            ),
            SizedBox(
              height: height * .025,
            ),
            RoundButton(
              title: 'Login',
              loading: authViewMode.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };

                  // Map data = {
                  //   {
                        'user_name' : 'shrikant@wepora.com',
                        'password' : '123456789'
                    }
                  // };

                  authViewMode.loginApi(data, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: Text("Don't have an accont? Sign Up")),
            IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, RoutesName.layout);
              }),
              icon: Icon(Icons.home),
              color: Theme.of(context).primaryColorDark,
              iconSize: 40,
            ),
            SizedBox(
              height: height * .2,
            ),
          
          ],
        ),
      )),
    );
  }
}
