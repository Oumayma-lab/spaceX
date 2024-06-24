import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:spacex/Models/Launch.dart';
import 'package:spacex/Models/Mission.dart';

class dataService {
  static const String launchesUrl = 'https://api.spacexdata.com/v3/launches';
  static const String missionsUrl = 'https://api.spacexdata.com/v3/missions';

  Future<void> fetchAndCacheLaunches() async {
    final response = await http.get(Uri.parse(launchesUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Launch> launches = data.map((json) => Launch.fromJson(json)).toList();

      var box = Hive.box<Launch>('launches');
      await box.clear();
      await box.addAll(launches);
    } else {
      throw Exception('Failed to load launches');
    }
  }

  Future<void> fetchAndCacheMissions() async {
    final response = await http.get(Uri.parse(missionsUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Mission> missions = data.map((json) => Mission.fromJson(json)).toList();
      var box = Hive.box<Mission>('missions');
      await box.clear();
      await box.addAll(missions);
    } else {
      throw Exception('Failed to load missions');
    }
  }
}
