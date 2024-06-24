import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/Models/Mission.dart';
import 'package:spacex/Repository/missionRepository.dart';
import 'package:spacex/Utils/missionsCubit.dart';
import 'package:spacex/Utils/missionsState.dart';
import 'package:spacex/UI/Details/missionDetails.dart';


class MissionsPage extends StatefulWidget {
  const MissionsPage({Key? key}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  late MissionsCubit _missionCubit;

  @override
  void initState() {
    super.initState();
    _missionCubit = MissionsCubit(missionRepository: missionRepository());
    _missionCubit.getMissions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/mission_background.jpg',
              fit: BoxFit.cover,
            ),
            AppBar(
              title: Text(
                'Missions',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: BlocBuilder<MissionsCubit, MissionsState>(
          bloc: _missionCubit,
          builder: (context, state) {
            return buildUI(state);
          },
        ),
      ),
    );
  }

  Widget buildUI(MissionsState state) {
    switch (state.runtimeType) {
      case MissionsInitial:
        return const Center(child: CircularProgressIndicator());
      case MissionsLoading:
        return const Center(child: CircularProgressIndicator());
      case MissionsLoaded:
        final missions = (state as MissionsLoaded).missions;
        return missions.isEmpty
            ? const Center(child: Text('No missions to display yet :( '))
            : RefreshIndicator(
          onRefresh: () => _missionCubit.refreshMissions(),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: missions.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              final mission = missions[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => missionDetails(mission: mission),
                    ),
                  );
                },
                child: buildMissionCard(mission),
              );
            },
          ),
        );
      case MissionsError:
        final error = (state as MissionsError).error;
        return Center(child: Text('Error: $error'));
      default:
        return const Center(child: Text('Unknown state'));
    }
  }

  Widget buildMissionCard(Mission mission) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mission ID: ${mission.missionId}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Mission Name: ${mission.missionName}',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _missionCubit.close();
    super.dispose();
  }
}
