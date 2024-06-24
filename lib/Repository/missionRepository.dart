import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:spacex/Models/Mission.dart';


class missionRepository {

  final Box<Mission> missionBox = Hive.box<Mission>('missions');
  final client = http.Client();

  Future<List<Mission>> getMissions() async {
    final response = await client.get(Uri.parse('https://api.spacexdata.com/v3/missions'));

    if (response.statusCode != 200) {
      throw Exception('Something went wrong. Try again later');
    }

    final json = jsonDecode(response.body) as List<dynamic>;
    final mission = json.map((e) => Mission.fromJson(Map<String, dynamic>.from(e))).toList();

    return mission;
  }

  Future<void> saveMissionsLocally(List<Mission> missions) async {
    for (final mission in missions) {
      await missionBox.put(mission.missionId, mission);
    }
  }

  Future<List<Mission>> fetchAllLocalMissions() async {
    return missionBox.values.toList();
  }
}