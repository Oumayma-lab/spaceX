import 'package:flutter/foundation.dart';
import '../Models/Mission.dart';

@immutable
abstract class MissionsState {}

class MissionsInitial extends MissionsState {}

class MissionsLoading extends MissionsState {}

class MissionsLoaded extends MissionsState {
  final List<Mission> missions;
  MissionsLoaded({required this.missions});
}

class MissionsError extends MissionsState {
  final String error;
  MissionsError({required this.error});
}
