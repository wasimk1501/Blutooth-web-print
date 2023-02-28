import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:md_calculator/pages/spash_screen.dart';

const Color appColor = Color(0xff1bb193);
late Box doctorBox;
late Box patientBox;
late Box loginBox;
late Box myBox;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Hive.initFlutter();
  doctorBox = await Hive.openBox("DoctorDetails");
  patientBox = await Hive.openBox("PatientDetails");
  loginBox = await Hive.openBox("isLogin");
  myBox = await Hive.openBox("MyBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: false,
      title: 'General App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}
