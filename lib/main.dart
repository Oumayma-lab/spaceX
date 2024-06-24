
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'Models/Mission.dart';
import 'UI/Home/Home.dart';
import 'package:hive/hive.dart';
import 'Utils/hiveInitializer.dart';
import 'package:spacex/Utils/launchesCubit.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initialiseHive();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    ); // hedhi besh l'app tabda unique fel affichage mahma ken device ios / android
    return const MaterialApp(
      title: 'SpaceX Launches',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}