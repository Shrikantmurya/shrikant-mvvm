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

  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context) async {
 
    setLoading(true);
  
    _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      final newToken = value['token'];
      final prefsToken = await SharedPreferences.getInstance();
      prefsToken.setString('token', newToken);
      print(prefsToken.get('token'));
      userPreference.saveUser(
        UserModel(
          token: newToken,
        )
      );

      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.layout);
      if(kDebugMode){
        print(value);
      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }


  Future<void> signUpApi(dynamic data , BuildContext context) async {

    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.layout);
      if(kDebugMode){
        print(value.toString());

      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

}
