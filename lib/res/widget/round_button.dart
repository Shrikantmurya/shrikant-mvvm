import 'package:flutter/material.dart';

import '../../utils/color.dart';




class RoundButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  const RoundButton({Key? key ,
    required this.title,
    this.loading = false ,
     required this.onPress ,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.83,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(2)
        ),
        child: Center(
            child:loading ? CircularProgressIndicator(color: Colors.white,) :  Text(title ,
              style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor, fontSize: 20),
            )),
      ),
    );
  }
}
