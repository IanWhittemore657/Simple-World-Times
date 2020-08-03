import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};

  @override
  Widget build(BuildContext context) {

    //getting the data from the loading screen
    //data = ModalRoute.of(context).settings.arguments;
    //print(data);

    //if data is the same then do nothing , if not then go to modalroute
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //setbackground
    String bgImage = data['isDatetime'] ? "day.png" : "night.png";
    Color bgColor = data["isDatetime"] ? Colors.blue : Colors.indigo[700];
    Color bgIcon = data["isDatetime"] ? Colors.black : Colors.white;
    Color bgText = data["isDatetime"] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

        child: Container(

          decoration:BoxDecoration(
            image:DecorationImage(
              image:AssetImage("assets/$bgImage"),
              fit:BoxFit.cover,


            ),
          ),


          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100,0,0),
            child: Column(
              children: <Widget>[

                FlatButton.icon(

                  onPressed: () async {

                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDatetime': result['isDatetime'],
                          'flag': result['flag'],
                        };
                      });
                    }

                  },

                    icon: Icon(
                        Icons.edit_location,
                        color:bgIcon,


                    ),
                    label: Text(
                        'Edit Location',
                      style:TextStyle(
                        color:bgText,
                      ),

                    ),
                ),

                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      //color:bgText,
                    ),
                  ),
                ],

                ),

              SizedBox(height: 20.0),
                Text(
                  data["time"],
                  style:TextStyle(
                    fontSize: 66,
                   // color:bgText,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}