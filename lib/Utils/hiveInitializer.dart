import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spacex/Models/Launch.dart';
import 'package:spacex/Repository/missionRepository.dart';
import 'package:spacex/Repository/launchRepository.dart';
import '../Models/Mission.dart';
import 'package:path_provider/path_provider.dart' as path_provider;



Future<void> initialiseHive() async {

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(LaunchAdapter());
  Hive.registerAdapter(MissionAdapter());

  await Hive.openBox<Launch>('launches');
  await Hive.openBox<Mission>('missions');
 }