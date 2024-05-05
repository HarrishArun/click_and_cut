import 'package:clickandcut_admin/Providers/SelectedServicesProvider.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/registrationScreen.dart';
import 'package:clickandcut_admin/Screens/RegistrationScreens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';



Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>SelectedServicesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //brandblue
        theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
        home: SafeArea(child: SplashScreen()),
      ),
    );
  }
}



