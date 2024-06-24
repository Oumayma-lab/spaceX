import 'package:flutter/material.dart';

import '../../Models/Mission.dart';

class missionDetails extends StatelessWidget {
  final Mission mission;

  const missionDetails({Key? key, required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          mission.missionName,
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
            buildDetailItem('Mission ID', mission.missionId),
            buildDetailItem('Description', mission.description),
            buildDetailItem('Manufacturers', mission.manufacturers.join(', ')),
            buildDetailItem('Payload IDs', mission.payloadIds.join(', ')),
            buildDetailButton('Wikipedia', mission.wikipedia),
            buildDetailButton('Website', mission.website),
            buildDetailButton('Twitter', mission.twitter),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Column(
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
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildDetailButton(String label, String url) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
        ),
        child: Text(
          '$label: $url',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
