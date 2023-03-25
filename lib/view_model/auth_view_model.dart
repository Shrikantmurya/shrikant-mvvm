import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/model/user_model.dart';
import '/respository/auth_repository.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false ;
  bool get loading => _loading ;

  bool _signUploading = false ;
  bool get signUploading => _signUploading ;


  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUploading(bool value){
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {
 
    setloading(true);
    _myRepo.loginApi(data).then((value) async {
      setloading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      final newToken = value['token'];
      final prefsToken = await SharedPreferences.getInstance();
      prefsToken.setString('token', newToken);
      if (kDebugMode) {
        print(prefsToken.get('token'));
      }
      userPreference.saveUser(
        UserModel(
          token: newToken,
        )
      );

      // ignore: use_build_context_synchronously
      Utils.flushBarerrorMessage('Login Successfully', context);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RoutesName.layout);
      if(kDebugMode){
        print(value);
      }
    }).onError((error, stackTrace){
      setloading(false);
      Utils.flushBarerrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }


  Future<void> signUpApi(dynamic data , BuildContext context) async {

    setSignUploading(true);

    _myRepo.signUpApi(data).then((value){
      setSignUploading(false);
      Utils.flushBarerrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.layout);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setSignUploading(false);
      Utils.flushBarerrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

}
