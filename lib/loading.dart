import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String gettheme;
  PermissionHandler _permissionHandler = PermissionHandler();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sleepscreen();
  }

  sleepscreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/home');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SpinKitDoubleBounce(
        size: 200.0,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage('assets/dummy6.png')),
              shape: BoxShape.circle,
              color: index.isEven ? Colors.white : Colors.black12,
            ),
          );
        },
      ),
    );
  }
}
