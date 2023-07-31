import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_class.dart';
class ChoseLocation extends StatefulWidget {
  const ChoseLocation({super.key});

  @override
  State<ChoseLocation> createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
 List<WorldTime> locations = [
   WorldTime(location: "Kampala", flag: "Kampala.png", url: "Africa/Kampala"),
   WorldTime(location: "Nairobi", flag: "Nairobi.jpeg", url: "Africa/Nairobi"),
   WorldTime(location: "Kigali", flag: "Kigali.jpeg", url: "Africa/Kigali"),
   WorldTime(location: "Cairo", flag: "Cairo.jpeg", url: "Africa/Cairo"),
   WorldTime(location: "Johannesburg", flag: "Johannesburg.jpeg", url: "Africa/Johannesburg"),
   WorldTime(location: "Lagos", flag: "Lagos.jpeg", url: "Africa/Lagos"),
   WorldTime(location: "Algiers", flag: "Algiers.jpeg", url: "Africa/Algiers"),
   WorldTime(location: "Casablanca", flag: "Casablanca.jpeg", url: "Africa/Casablanca"),
   WorldTime(location: "Juba", flag: "Juba.jpeg", url: "Africa/Juba"),
   WorldTime(location: "Tripoli", flag: "Tripoli.jpeg", url: "Africa/Tripoli"),
 ];
 void updateTime(index) async{
   WorldTime current_instance = locations[index];
   await current_instance.getTIme();
   Navigator.pop(context,{
     'location' : current_instance.location,
     'flag' : current_instance.flag,
     'time' : current_instance.time,
     'isDay' : current_instance.isDay
   });

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Chose loction"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.5,horizontal: 10),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
        },

      ),
    );
  }
}
