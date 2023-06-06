import 'dart:developer';

import 'package:rewup/splashscreen.dart';
import 'package:rewup/utils/constants.dart';
import 'package:rewup/utils/routes.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'allpackages.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogin();

  runApp(MyApp());
}

String? token;
checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  log('tokeen');
  log(token.toString());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => FocusableActionDetector(
        child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
            },
            child: GetMaterialApp(
              getPages: Routes.routes,
                debugShowCheckedModeBanner: false, home: SplashScreen())),
      ),
    );
  }
}
