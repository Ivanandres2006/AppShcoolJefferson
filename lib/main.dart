import 'package:app_jefferson/screens/Calendario/Calendar.dart';
import 'package:app_jefferson/screens/Exponent/login/login_screen/login_realScreen.dart';
import 'package:app_jefferson/screens/Home/HomeScreenn.dart';
import 'package:app_jefferson/screens/Lapsos/Primer_Lapso.dart';
import 'package:app_jefferson/screens/root/root.dart';
import 'package:app_jefferson/service/currentUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  //print(DateTime.now());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JeffersonApp',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromARGB(255, 119, 124, 135),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            minWidth: 200,
            height: 40.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        routes: {
          '1erLapso': (context) => PrimerLapso(),
          'Lapsos': (context) => HomeScreen(),
          'Calendar': (context) => CalendarScreen(),
          //'Send': (context) => SendGmail(),
        },
        home: OurRoot(),
      ),
    );
  }
}
