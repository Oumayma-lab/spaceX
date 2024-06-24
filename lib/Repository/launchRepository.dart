import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:spacex/Models/Launch.dart';

class launchRepository {

  final Box<Launch> launchBox = Hive.box<Launch>('launches');
  final client = http.Client();

  Future<List<Launch>> getLaunches() async {
    final response = await client.get(Uri.parse('https://api.spacexdata.com/v3/launches'));

    if (response.statusCode != 200) {
      throw Exception('Something went wrong. Try again later');
    }

    final json = jsonDecode(response.body) as List<dynamic>;
    final launches = json.map((e) => Launch.fromJson(Map<String, dynamic>.from(e))).toList();

    return launches;
  }

  Future<void> saveLaunchesLocally(List<Launch> launches) async {
    for (final launch in launches) {
      await launchBox.put(launch.flightNumber, launch);
    }
  }

  Future<List<Launch>> fetchAllLocalLaunches() async {
    final localLaunches = launchBox.values.toList();
    return launchBox.values.toList();
  }
}
