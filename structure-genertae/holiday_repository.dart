
import '/data/network/BaseApiServices.dart';
import '/data/network/NetworkApiService.dart';
import '/model/holiday_model.dart';
import '/res/app_url.dart';

class HolidayRepository {
  BaseApiServices _apiServices = NetworkApiService() ;

  Future<HolidayListModel> fetchHolidayListApi()async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.hrcontactListEndPoint);
      return response = HolidayListModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }

}
