import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  bool isScanning = false;
  List<ScanResult> scanResults = [];

  void _scanDevices() async {
    if (isScanning) return;
    setState(() {
      isScanning = true;
      scanResults.clear(); // Clear previous results
    });

    // Start scanning
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

    // Listen for scan results
   var subscription = FlutterBluePlus.onScanResults.listen((results) async {
      if (results.isNotEmpty) {
        FlutterBluePlus.stopScan();
        print(results);
      }


      if (mounted) {
        setState(() {
          scanResults = results;
        });
      }
    });

   FlutterBluePlus.cancelWhenScanComplete(subscription);

    // Stop scanning after timeout
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isScanning = false;
        });
        FlutterBluePlus.stopScan();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLE Scanner")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Device list
          Expanded(
            child: scanResults.isNotEmpty
                ? ListView.builder(
              itemCount: scanResults.length,
              itemBuilder: (context, index) {
                final data = scanResults[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(data.device.name.isNotEmpty
                        ? data.device.name
                        : "Unknown Device"),
                    subtitle: Text(data.device.id.id),
                    trailing: Text("${data.rssi} dBm"),
                  ),
                );
              },
            )
                : const Center(child: Text("No Device Found")),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _scanDevices, // ✅ Fixed button call
            child: Text(isScanning ? "Scanning..." : "SCAN"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
