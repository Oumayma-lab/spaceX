import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/Utils/launchesState.dart';
import 'package:spacex/Utils/launchesCubit.dart';
import '../../Models/Launch.dart';
import '../../Repository/launchRepository.dart';
import '../Details/launchDetails.dart';


class launchesPage extends StatefulWidget {
  const launchesPage ({Key? key}) : super(key: key);

  @override
  LaunchesPageState createState() => LaunchesPageState();
}

class LaunchesPageState extends State<launchesPage> {
  late launchesCubit _launchesCubit;

  @override
  void initState() {
    super.initState();
    _launchesCubit = launchesCubit(launchRepository: launchRepository());
    _launchesCubit.getLaunches();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/launch_background.jpg',
              fit: BoxFit.cover,
            ),
            AppBar(
              title: Text(
                'Launches',
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
        child: BlocBuilder<launchesCubit, launchesState>(
          bloc: _launchesCubit,
          builder: (context, state) {
            return buildUI(state);
          },
        ),
      ),
    );
  }


  Widget buildUI(launchesState state) {
    switch (state.runtimeType) {
      case LaunchesInitial:
        return const Center(child: CircularProgressIndicator());
      case LaunchesLoading:
        return const Center(child: CircularProgressIndicator());
      case LaunchesLoaded:
        final launches = (state as LaunchesLoaded).launches;
        return launches.isEmpty
            ? const Center(child: Text('No launches to display yet :( '))
            : RefreshIndicator(
          onRefresh: () => _launchesCubit.refreshLaunches(),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: launches.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              final launch = launches[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => launchDetails(launch: launch),
                    ),
                  );
                },
                child: buildLaunchCard(launch),
              );
            },
          ),
        );
      case LaunchesError:
        final error = (state as LaunchesError).error;
        return Center(child: Text('Error: $error'));
      default:
        return const Center(child: Text('Unknown state'));
    }
  }

  Widget buildLaunchCard(Launch launch) {
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
            'Mission Name: ${launch.missionName}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white ),
          ),
          const SizedBox(height: 5),
          Text(
            'Launch Year: ${launch.launchYear}',
            style: TextStyle(color: Colors.white)
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _launchesCubit.close();
    super.dispose();
  }
}
