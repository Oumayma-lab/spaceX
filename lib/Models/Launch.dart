import 'package:hive/hive.dart';
part 'Launch.g.dart';


@HiveType(typeId: 0)
class Launch extends HiveObject {

  @HiveField(0)
  final int flightNumber;
  @HiveField(1)
  final String missionName;
  @HiveField(2)
  final List<String> missionId;
  @HiveField(3)
  final String launchYear;
  @HiveField(4)
  final DateTime launchDateLocal;

  Launch({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.launchYear,
    required this.launchDateLocal,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      flightNumber: json['flight_number'],
      missionName: json['mission_name'],
      missionId: List<String>.from(json['mission_id']),
      launchYear: json['launch_year'],
      launchDateLocal: DateTime.parse(json['launch_date_local']),
    );
  }
}