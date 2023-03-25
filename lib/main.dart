import 'package:flutter/material.dart';
import 'package:wepora/utils/color.dart';
import '/utils/routes/routes.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/auth_view_model.dart';
import '/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => ThemeProvider())
        ],
      
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'NeoEnergy',
          theme: themeProvider.isDarkTheme ? themeDataDark : themeDataLight,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),


    );
  }
}

