import 'package:flutter/material.dart';
import 'package:spacex/UI/Home/Search.dart';
import 'package:spacex/UI/Pages/launchesPage.dart';
import 'package:spacex/UI/Pages/missionsPage.dart';

import 'Header.dart';
import 'mainSection.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const HeaderSection(),
                const SearchSection(),
                MainSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(context),
    );
  }


  Widget NavigationBar(BuildContext context) {

    return Container(
      child: Container(
        height: 74 ,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                spreadRadius: 10,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.black.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                label: 'Launches',
                icon: Icon(
                  Icons.rocket,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: "Missions",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.more_horiz_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => launchesPage()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MissionsPage()),
                  );
                  break;
              }
            },
          ),
          ),
        ),
      );

  }
}

