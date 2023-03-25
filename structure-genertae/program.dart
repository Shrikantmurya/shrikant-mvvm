import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../res/widget/contact_widget.dart';
import '../view_model/program_view_model.dart';
class Program extends StatefulWidget {
  const Program({super.key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  ProgramViewViewModel  programViewViewModel = ProgramViewViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    ProgramViewViewModel  programViewViewModel = ProgramViewViewModel();
    programViewViewModel.fetchProgramListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final userPrefernece = Provider.of<ProgramViewViewModel>(context);
    return ChangeNotifierProvider<ProgramViewViewModel>(
        create: (BuildContext context) => programViewViewModel,
        child: Consumer<ProgramViewViewModel>(
            builder: (context, value, _){
              
            }),
      );
       
  }
}
