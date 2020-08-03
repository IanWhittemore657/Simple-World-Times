import 'package:flutter/material.dart';
import 'package:worldtimes/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url:"Africa/Lagos", location: 'Cameroon', flag: 'cameroon.png'),
  ];

  //list view builder to show each item in the list , previously used map method

  void updateTime(index) async{
    WorldTime instanceS = locations[index];
    await instanceS.getTime();

    //navigate to home screen and pass data back to home screen

    //sends back to home screen (POP)

    Navigator.pop(context,{
      "location": instanceS.location,
      "flag": instanceS.flag,
      "time":instanceS.time,
      "isDatetime":instanceS.isDatetime,
    });

  }

@override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),

      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index)
        {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
          child: Card(
            
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                
                  title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),

              ),
            ),
        );
        },
      ),


      //body:RaisedButton(
        //onPressed: (){
        //  setState(() {
        //    counter += 1;
        //  });
       // },
       // child:Text("counter is $counter"),
     // ),

    );
  }
}
