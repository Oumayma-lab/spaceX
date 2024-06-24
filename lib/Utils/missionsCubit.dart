import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'missionsState.dart';
import 'package:spacex/Repository/missionRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionsCubit extends Cubit<MissionsState> {
  final missionRepository _missionRepository;

  MissionsCubit({required missionRepository missionRepository})
      : _missionRepository = missionRepository,
        super(MissionsInitial());

  Future<void> getMissions() async {
    emit(MissionsLoading());
    try {
      final hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        final remoteMissions = await _missionRepository.getMissions();
        await _missionRepository.saveMissionsLocally(remoteMissions);
        emit(MissionsLoaded(missions: remoteMissions));
      } else {
        final localMissions = await _missionRepository.fetchAllLocalMissions();
        emit(MissionsLoaded(missions: localMissions));
      }
    } catch (e) {
      emit(MissionsError(error: e.toString()));
    }
  }

  Future<void> refreshMissions() async {
    try {
      final remoteLaunches = await _missionRepository.getMissions();
      await _missionRepository.saveMissionsLocally(remoteLaunches);
      emit(MissionsLoaded(missions: remoteLaunches));
    } catch (e) {
      emit(MissionsError(error: e.toString()));
    }
  }

}
