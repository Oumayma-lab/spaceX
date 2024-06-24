import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'launchesState.dart';
import 'package:spacex/Repository/launchRepository.dart';


class launchesCubit extends Cubit<launchesState> {
  final launchRepository _launchRepository;

  launchesCubit({required launchRepository launchRepository})
      : _launchRepository = launchRepository,
        super(LaunchesInitial());

  Future<void> getLaunches() async {
    emit(LaunchesLoading());
    try {
      final hasConnection = await InternetConnectionChecker().hasConnection;
      if (hasConnection) {
        final remoteLaunches = await _launchRepository.getLaunches();
        await _launchRepository.saveLaunchesLocally(remoteLaunches);
        emit(LaunchesLoaded(launches: remoteLaunches));
      } else {
        final localLaunches = await _launchRepository.fetchAllLocalLaunches();
        emit(LaunchesLoaded(launches: localLaunches));
      }
    } catch (e) {
      emit(LaunchesError(error: e.toString()));
    }
  }

  Future<void> refreshLaunches() async {
    try {
      final remoteLaunches = await _launchRepository.getLaunches();
      await _launchRepository.saveLaunchesLocally(remoteLaunches);
      emit(LaunchesLoaded(launches: remoteLaunches));
    } catch (e) {
      emit(LaunchesError(error: e.toString()));
    }
  }

}
