import 'package:hive/hive.dart';
part 'Mission.g.dart';

@HiveType(typeId: 1)
class Mission extends HiveObject {

  @HiveField(0)
  final String missionId;
  @HiveField(1)
  final String missionName;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> manufacturers;
  @HiveField(4)
  final List<String> payloadIds;
  @HiveField(5)
  final String wikipedia;
  @HiveField(6)
  final String website;
  @HiveField(7)
  final String twitter;

  Mission({

    required this.missionId,
    required this.missionName,
    required this.description,
    required this.manufacturers,
    required this.payloadIds,
    required this.wikipedia,
    required this.website,
    required this.twitter,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      missionId: json['mission_id'],
      missionName: json['mission_name'],
      description: json['description'],
      manufacturers: List<String>.from(json['manufacturers']),
      payloadIds: List<String>.from(json['payload_ids']),
      wikipedia: json['wikipedia'] ?? '',
      website: json['website'] ?? '',
      twitter: json['twitter'] ?? '',
    );
  }
}
