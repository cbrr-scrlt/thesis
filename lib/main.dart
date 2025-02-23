import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:thesiiiis/ble_controller.dart';
import 'package:thesiiiis/pages/bluetooth.dart';
import 'package:thesiiiis/pages/homepage.dart';
import 'package:thesiiiis/pages/waste.dart';
import 'package:thesiiiis/pages/status.dart';
import 'LoginPage.dart';


void main() {
  runApp(MyApp());
}

class MyApps extends StatefulWidget{
  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LoginPage(),
    HomePage(),
    WastePage(),
    StatusPage(),
    BluetoothPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Robotic Arm App',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pinkAccent, // Custom color
          elevation: 5, // Shadow effect
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,  // Change selected item color
          unselectedItemColor: Colors.white,  // Change unselected item color
          backgroundColor: Colors.pink, // Background color
          type: BottomNavigationBarType.fixed, // Keeps labels visible
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, size: 28),
              label: "Waste Bin",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dehaze, size: 28),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dehaze, size: 28),
              label: "Connect",
            ),
          ],
        ),
      ),
    );
  }
}
