import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_class.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data = {};
  @override
  Widget build(BuildContext context) {

     data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map<dynamic,dynamic>;
     String bgimage = data['isDay']? 'day2.jpg' : 'night.webp';
     Color? bgcolor = data['isDay']? Colors.blue[500] : Colors.black87;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed:() async {
                        dynamic result = await Navigator.pushNamed(context, "/location");
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'flag' : result['flag'],
                            'isDay' : result['isDay']
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[600],
                      ),
                    label: Text("Edit location",
                    style: TextStyle(
                      color: Colors.grey
                    ),),

                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),

                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
