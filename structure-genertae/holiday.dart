import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../res/widget/contact_widget.dart';
import '../view_model/holiday_view_model.dart';
class Holiday extends StatefulWidget {
  const Holiday({super.key});

  @override
  State<Holiday> createState() => _HolidayState();
}

class _HolidayState extends State<Holiday> {
  HolidayViewViewModel  holidayViewViewModel = HolidayViewViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    holidayViewViewModel.fetchHolidayListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final userPrefernece = Provider.of<HolidayViewViewModel>(context);
    return ChangeNotifierProvider<HolidayViewViewModel>(
        create: (BuildContext context) => holidayViewViewModel,
        child: Consumer<HolidayViewViewModel>(
            builder: (context, value, _){
              switch(value.DataList.status!){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(
                          Icons.error_outline,
                          color: Theme.of(context).primaryColorDark,
                          size: 100.0,
                        ),
                    
                    Text(value.DataList.message.toString(),  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, height: 2),)
                  ],));
                case Status.COMPLETED:
                  return ListView.builder(
                   
                      itemCount: value.DataList.data!.message!.length,
                      itemBuilder: (context,index){
                    return Text('builder gerate widgets in value');
                 });

              }
              return Container();
            }),
      );
       
  }
}
