import 'package:flutter/material.dart';
import '../view_model/dashboard_view_model.dart';
import '/data/response/status.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardViewModel  dashboardViewModel = DashboardViewModel();
  
  @override
  void initState() {
    dashboardViewModel.fetchDashboardListApi();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<DashboardViewModel>(
        create: (BuildContext context) => dashboardViewModel,
        child: Consumer<DashboardViewModel>(
            builder: (context, value, _){
              switch(value.dataList.status!){
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.error:
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
                    
                    Text(value.dataList.message.toString(),  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, height: 2),)
                  ],));
                case Status.completed:
                  return ListView.builder(
                   
                      itemCount: value.dataList.data!.requests!.length,
                      itemBuilder: (context,index){
                    return Text(value.dataList.data!.requests![index].bessId.toString(), style: Theme.of(context).textTheme.bodyLarge,);
                  });

              }
            }),
      ) ,
    );
  }
}
