import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  final bool isRobotMalfunctioning = true; // Change this based on actual status
  final double batteryHealth = 0.6; // 60% battery health
  final double capacity = 0.3; // 30% capacity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Status Page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Battery Health: ${(batteryHealth * 100).toInt()}%"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: batteryHealth,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text("Capacity: ${(capacity * 100).toInt()}%"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: capacity,
                backgroundColor: Colors.grey[300],
                color: Colors.yellow,
              ),
            ),
            SizedBox(height: 30),
            isRobotMalfunctioning
                ? Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Warning: Robot has malfunctioned!",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
                : Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Robot is functioning normally.",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
