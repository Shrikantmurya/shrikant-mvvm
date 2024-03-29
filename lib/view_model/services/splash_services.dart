
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/user_view_model.dart';

class SplashServices {


  Future<UserModel> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      if (kDebugMode) {
        print(value.token.toString());
      }

      if(value.token.toString() == 'null' || value.token.toString() == ''){
        await Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RoutesName.layout);
      }else {
        await  Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RoutesName.layout);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}