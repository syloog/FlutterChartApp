import 'package:data_dog_app/screens/waitingPage.dart';
import 'package:data_dog_app/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_dog_app/util/consts.dart';
import 'package:data_dog_app/screens/login.dart';
import 'package:data_dog_app/screens/signUpPage.dart';
import 'cpuPage.dart';
import 'gpuPage.dart';
import 'hddPage.dart';
import 'home.dart';
import 'netPage.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/cpu': (context) => CpuPage(HexColor("FFFC00")),
        '/home': (context) => MainScreenPage(),
        '/gpu': (context) => GpuPage(HexColor("FFFC00")),
        '/net': (context) => NetPage(HexColor("FFFC00")),
        '/hdd': (context) => HddPage(HexColor("FFFC00")),
        '/signup': (context) => SignUpPage(),
        '/wait': (context) => WaitingPage(),
      },
    );
  }
}
