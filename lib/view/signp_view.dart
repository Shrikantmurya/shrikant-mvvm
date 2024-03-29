import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../res/widget/custom_textfield.dart';
import '../res/widget/password_field.dart';
import '../utils/text_styles.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../res/widget/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
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

    final height  = MediaQuery.of(context).size.height * 1 ;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
           [
            SizedBox(
              height: height * .1,
            ),
            SvgPicture.asset(
              'assets/images/logo.png',
              height: 100,
            ),
            const Align(
              child: Text('Wepora MVVM', style: loginHeaderStyle),
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
              title: 'Sign Up',
              loading: authViewMode.loading,
              onPress: () {
                if(_emailController.text.isEmpty){

                  Utils.flushBarerrorMessage('Please enter email', context);
                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarerrorMessage('Please enter password', context);

                }else if(_passwordController.text.length < 6){
                  Utils.flushBarerrorMessage('Please enter 6 digit password', context);

                }else {
                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };

                  authViewMode.signUpApi(data , context);
                  if (kDebugMode) {
                    print('api hit');
                  }
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: const Text("Don't have an accont? Login")),
            IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, RoutesName.layout);
              }),
              icon: const Icon(Icons.home),
              color: Theme.of(context).primaryColorDark,
              iconSize: 40,
            ),
            SizedBox(
              height: height * .1,
            ),
         
          ],
        
        ),
      ),
      ),
    );
  }
}
