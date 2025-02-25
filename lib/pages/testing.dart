import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PiControlPage extends StatefulWidget {
  @override
  _PiControlPageState createState() => _PiControlPageState();
}

class _PiControlPageState extends State<PiControlPage> {
  String _status = "Waiting for response...";
  // final String _piUrl =
  //     "http://192.168.1.168:5000"; // Replace with your Pi's actual IP

  Future<void> sendControlCommand(String command, String piUrl) async {
    try {
      final response = await http.post(
        Uri.parse('http://$piUrl:5000/control'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"command": command}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _status = "Success: ${response.body}";
        });
      } else {
        setState(() {
          _status = "Error: ${response.statusCode} - ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _status = "Exception: $e";
      });
    }
  }

  final _textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Testing Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'example:192.168.1.168',
                    labelText: "ip",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textControl.clear();
                        },
                        icon: const Icon(Icons.clear))),
                controller: _textControl,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        {sendControlCommand("first", _textControl.text)},
                    child: Text('rotate 1st servo'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        sendControlCommand("second", _textControl.text),
                    child: Text('rotate 2nd servo'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => sendControlCommand("third", _textControl.text),
              child: Text('return'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_status),
            ),
          ],
        ),
      ),
    );
  }
}
