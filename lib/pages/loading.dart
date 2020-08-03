import 'package:flutter/material.dart';
import "package:http/http.dart";
import "dart:convert";
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:worldtimes/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //q3 - (THIS HAS BEEN MOVED TO ITS OWN CLASS
  //void getTime() async
  //{
  //  Response response  = await get("http://worldtimeapi.org/api/timezone/Africa/Lagos");
    //Map data = jsonDecode(response.body);
    //print(data);

    //get properties from data
    //String datetime = data["datetime"];
   // String offset = data["utc_offset"].substring(1,3);
    //print(datetime);
    //print(offset);

    //create DateTime object
    //DateTime now = DateTime.parse(datetime);
   // now = now.add(Duration(hours:int.parse(offset)));
   // print(now);
  //}

 // void getData() async { //this makes it sync

    //Q2 get data from json
    //Response response = await get("https://jsonplaceholder.typicode.com/todos/1");
    //Map data = jsonDecode(response.body);

    //print(data);
    //print(data["title"]);


    //Q1 : simulate delay of getting data

    //String username = await Future.delayed(Duration(seconds:3),(){ // this make it wait for this to finish first
    //return "Ian";
    //});


    //simulate network request to get bio of user
    //String Bio = await Future.delayed(Duration(seconds:3),(){ // then will go here and then finally print statement
    //  return "vegan,musician & egg collector" ;
    //});

    //print("$username - $Bio");
  //}

  //int counter = 0;

  //String time = "loading";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location:"Cameroon",flag:"cameroon.png",url:"Africa/Lagos");
    await instance.getTime();

    //sending the data to the home screen
    Navigator.pushReplacementNamed(context,"/home",arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time":instance.time,
      "isDatetime":instance.isDatetime,

    });

    //this sets the old name to the new instance
    //setState(() {
     // time = instance.time;
    //});
  }

  @override
  void initState(){
    super.initState();
    //getData();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitChasingDots(
          color:Colors.white,
          size:60.0,

        ),

      ),
    );
  }
}
