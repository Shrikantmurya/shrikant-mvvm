import 'package:flutter/material.dart';
import '/view_model/services/splash_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
      child: Image(image: AssetImage('assets/images/logo.png')),
    );
  }
}
