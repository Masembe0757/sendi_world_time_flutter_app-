import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String flag;
  late String time;
  late String url;
  late bool isDay;
  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTIme() async {

    try {
      Response response = await get(Uri.parse(
          "http://worldtimeapi.org/api/timezone/$url")); //Africa/Kampala

      Map data = jsonDecode(response.body);
      String date_time = data['datetime'];
      String off_set = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(date_time);
      now = now.add(Duration(hours: int.parse(off_set)));


      isDay = now.hour >6 && now.hour<19 ? true : false;


      time = DateFormat.jms().format(now);  //to be changed with int package
    }
    catch(e){
      time = "Unable to load time for this city";
    }
  }
}
