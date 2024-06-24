import 'package:flutter/material.dart';
import '../../Models/Launch.dart';

class launchDetails extends StatelessWidget {
  final Launch launch;

  const launchDetails({Key? key, required this.launch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Launch Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF636363),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailItem('Flight Number', launch.flightNumber.toString()),
            buildDetailItem('Mission Name', launch.missionName),
            buildDetailItem('Mission IDs', launch.missionId.join(', ')),
            buildDetailItem('Launch Year', launch.launchYear),
            buildDetailItem('Launch Date', '${launch.launchDateLocal.day}/${launch.launchDateLocal.month}/${launch.launchDateLocal.year}',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}