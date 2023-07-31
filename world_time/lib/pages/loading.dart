import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void worldTimeSetup() async {
    WorldTime instance = WorldTime(location: "Kampala", flag: "Kampala.png", url: "Africa/Kampala");
    await instance.getTIme();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay' : instance.isDay
    });
 
  }

  @override
  void initState() {
   worldTimeSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Colors.deepPurple,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 60,
        ),
      )
    );
  }
}
