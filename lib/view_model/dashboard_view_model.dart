import 'package:flutter/cupertino.dart';
import '../model/dashboard.dart';
import '../respository/dashboard_repository.dart';
import '/data/response/api_response.dart';

class DashboardViewModel with ChangeNotifier {

  final _myRepo = DashboardRepository();

  ApiResponse<DashboardListModel> dataList = ApiResponse.loading();

  setdataList(ApiResponse<DashboardListModel> response){
    dataList = response;
    notifyListeners();
  }

  Future<void> fetchDashboardListApi()async{

    setdataList(ApiResponse.loading());

    _myRepo.fetchDashboardList().then((value){

      setdataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setdataList(ApiResponse.error(error.toString()));

    });
  }


}