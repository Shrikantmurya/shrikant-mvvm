import 'package:flutter/material.dart';
import 'package:wepora/utils/color.dart';
import '../view_model/dashboard_view_model.dart';
import '/data/response/status.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DashboardViewModel  dashboardViewModel = DashboardViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    dashboardViewModel.fetchDashboardListApi();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: ChangeNotifierProvider<DashboardViewModel>(
        create: (BuildContext context) => dashboardViewModel,
        child: Consumer<DashboardViewModel>(
            builder: (context, value, _){
              switch(value.DataList.status){
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
                   
                      itemCount: value.DataList.data!.requests!.length,
                      itemBuilder: (context,index){
                    return Text(value.DataList.data!.requests![index].bessId.toString(), style: Theme.of(context).textTheme.bodyText1,);
                  });

              }
              return Container();
            }),
      ) ,
    );
  }
}
