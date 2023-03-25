

import 'package:flutter/cupertino.dart';
import '../model/program_model.dart';
import '/data/response/api_response.dart';
import '/respository/program_repository.dart';
class ProgramViewViewModel with ChangeNotifier {

  final _myRepo = ProgramRepository();

  ApiResponse<ProgramListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<ProgramListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchProgramListApi (dynamic data)async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchProgramListApi(data).then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
