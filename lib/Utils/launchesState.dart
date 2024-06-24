import 'package:flutter/foundation.dart';
import '../Models/Launch.dart';

@immutable
abstract class launchesState {}

class LaunchesInitial extends launchesState {}

class LaunchesLoading extends launchesState {}

class LaunchesLoaded extends launchesState {
  final List<Launch> launches;
  LaunchesLoaded({required this.launches});
}

class LaunchesError extends launchesState {
  final String error;
  LaunchesError({required this.error});
}