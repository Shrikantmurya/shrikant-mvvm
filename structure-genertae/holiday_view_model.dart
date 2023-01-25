

import 'package:flutter/cupertino.dart';
import '/data/response/api_response.dart';
import '/model/holiday_model.dart';
import '/respository/holiday_repository.dart';
class HolidayViewViewModel with ChangeNotifier {

  final _myRepo = HolidayRepository();

  ApiResponse<HolidayListModel> DataList = ApiResponse.loading();

  setDataList(ApiResponse<HolidayListModel> response){
    DataList = response ;
    notifyListeners();
  }

  Future<void> fetchHolidayListApi ()async{

    setDataList(ApiResponse.loading());

    _myRepo.fetchHolidayListApi().then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setDataList(ApiResponse.error(error.toString()));

    });
  }
}
