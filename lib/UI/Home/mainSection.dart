import 'package:flutter/material.dart';

class MainSection extends StatelessWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),

        ),
      ),
      child: Column(
        children: [
          Container(
            height: 500,
            padding: const EdgeInsets.all(25),
          ),
        ],
      ),
    );
  }
}
