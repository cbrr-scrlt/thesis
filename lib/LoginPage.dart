import 'package:flutter/material.dart';
import 'package:thesiiiis/MainPages.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyCon(),
    );
  }

  String _status = "";

  void submit() {
    setState(() {
      if (_email.text.isEmpty || _password.text.isEmpty) {
        _status = "fill both input";
      } else if (_email.text == "admin" && _password.text == "group1") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPages()));
      } else {
        _status = "Wrong email or password, try again";
      }
    });
  }

  Scaffold bodyCon() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.cyan,
            Colors.cyan,
            Colors.cyan,
          ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            headerCon(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              child: inputWrapperCon(),
            ))
          ],
        ),
      ),
    );
  }

  Padding headerCon() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Welcome to Robotic Arm App",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Padding inputWrapperCon() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: inputField(),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          buttonSubmit(),
          SizedBox(
            height: 40,
          ),
          Text(
            "$_status",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  final _email = TextEditingController();

  final _password = TextEditingController();

  Column inputField() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
            controller: _email,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
            controller: _password,
          ),
        ),
      ],
    );
  }

  GestureDetector buttonSubmit() {
    return GestureDetector(
      onTap: () {
        submit();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Colors.cyan[500],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
