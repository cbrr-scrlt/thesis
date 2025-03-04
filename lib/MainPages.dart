import 'package:flutter/material.dart';
import 'package:thesiiiis/LoginPage.dart';
import 'package:thesiiiis/pages/homepage.dart';
import 'package:thesiiiis/pages/status.dart';
import 'package:thesiiiis/pages/testing.dart';
import 'package:thesiiiis/pages/waste.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  _MainPagesState createState() {
    return _MainPagesState();
  }
}

class _MainPagesState extends State<MainPages> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    // LoginPage(),
    HomePage(),
    WastePage(),
    StatusPage(),
    PiControlPage()
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
          title: Center(
        child: Text(
        'Robotic Arm App',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
          backgroundColor: Colors.green[300], // Custom color
          elevation: 5,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: const Icon(Icons.logout_rounded, color: Colors.white,))
          ], // Shadow effect
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green, // Change selected item color
          unselectedItemColor: Colors.white, // Change unselected item color
          backgroundColor: Colors.green[300], // Background color
          type: BottomNavigationBarType.fixed, // Keeps labels visible
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size:30),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, size: 30),
              label: "Waste Bin",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dehaze, size: 30),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.aod, size: 30),
              label: "Testing",
            ),
          ],
        ),
      ),
    );
  }
}
